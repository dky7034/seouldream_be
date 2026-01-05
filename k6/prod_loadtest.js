import http from 'k6/http';
import { check, sleep } from 'k6';
import { Rate } from 'k6/metrics';

// 실패율 사용자 정의 지표
export let errorRate = new Rate('errors');

export let options = {
  stages: [
    { duration: '30s', target: 10 }, // 30초 동안 사용자 10명까지 서서히 증가 (Warm-up)
    { duration: '1m', target: 10 },  // 1분간 10명 유지 (부하 지속)
    { duration: '30s', target: 0 },  // 30초 동안 종료 (Cool-down)
  ],
  thresholds: {
    errors: ['rate<0.05'], // 에러율이 5% 미만이어야 성공 (운영 환경은 더 엄격하게)
    http_req_duration: ['p(95)<1000'], // 95%의 요청이 1초(1000ms) 이내여야 함 (네트워크 지연 고려)
  },
};

// ⚠️ 배포된 실제 운영/스테이징 서버 주소
const BASE_URL = 'https://api.seouldream.store'; 

// ⚠️ 실제 DB에 존재하는 테스트 계정 정보
const USERNAME = 'test'; 
const PASSWORD = 'password'; 

export function setup() {
  // 1. 로그인하여 토큰 발급
  // (주의: 운영 서버는 HTTPS 통신이므로 SSL 핸드쉐이크 시간이 추가될 수 있음)
  const payload = JSON.stringify({
    username: USERNAME, // API 스펙에 맞춤 (email -> username)
    password: PASSWORD,
  });

  const params = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  const loginRes = http.post(`${BASE_URL}/api/auth/login`, payload, params);
  
  check(loginRes, {
    'login successful': (r) => r.status === 200,
  });

  if (loginRes.status !== 200) {
    console.error(`Login failed: ${loginRes.status} ${loginRes.body}`);
    return { token: null };
  }

  const token = loginRes.json('accessToken');
  const memberId = loginRes.json('memberId'); // 본인 ID 추출
  return { token, memberId };
}

export default function (data) {
  if (!data.token) {
    console.log("No token, skipping iteration");
    sleep(1);
    return;
  }

  const params = {
    headers: {
      'Authorization': `Bearer ${data.token}`,
      'Content-Type': 'application/json',
    },
  };

  // 2. 인증된 API 호출 (본인 정보 조회)
  const res = http.get(`${BASE_URL}/api/members/${data.memberId}`, params);

  const result = check(res, {
    'status is 200': (r) => r.status === 200,
  });

  if (!result) {
    errorRate.add(1);
    console.error(`Request failed: ${res.status} ${res.body}`);
  }

  sleep(1); // 1초 대기 (너무 빠른 요청으로 인한 DOS 공격 차단 방지)
}
