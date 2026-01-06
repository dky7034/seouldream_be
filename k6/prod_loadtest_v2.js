import http from 'k6/http';
import { check, sleep } from 'k6';
import { Rate } from 'k6/metrics';

// 실패율 사용자 정의 지표
export let errorRate = new Rate('errors');

export let options = {
    // 실제 운영 서버 사양(t3a.small)의 한계를 확인하기 위해 300명으로 설정
    stages: [
        { duration: '1m', target: 100 },  // 1. 100명까지 워밍업
        { duration: '1m', target: 300 },  // 2. 300명으로 증가
        { duration: '3m', target: 300 },  // 3. 300명 상태로 3분간 지속 (한계 확인)
        { duration: '1m', target: 0 },    // 4. 종료
    ],
    thresholds: {
        errors: ['rate<0.05'], // 에러율 5% 미만 목표
        http_req_duration: ['p(95)<2000'], // 95% 요청이 2초 이내 응답 목표
    },
};

// ⚠️ 배포된 실제 운영/스테이징 서버 주소
// ✅ http로 변경 (s 제거)
const BASE_URL = 'http://43.201.203.29:8080';

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
