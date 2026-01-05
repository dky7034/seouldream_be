import http from 'k6/http';
import { check, sleep } from 'k6';
import { Rate } from 'k6/metrics';

// 실패율 사용자 정의 지표
export let errorRate = new Rate('errors');

export let options = {
  stages: [
    { duration: '30s', target: 20 }, // 30초 동안 사용자 20명까지 증가 (Ramp-up)
    { duration: '1m', target: 20 },  // 1분간 유지
    { duration: '30s', target: 0 },  // 30초 동안 종료 (Ramp-down)
  ],
  thresholds: {
    errors: ['rate<0.1'], // 에러율이 10% 미만이어야 성공
    http_req_duration: ['p(95)<500'], // 95%의 요청이 500ms 이내여야 함
  },
};

const BASE_URL = 'http://localhost:8080'; // 로컬 테스트 주소 (Docker 내부 통신 아님)

// 테스트에 사용할 사용자 정보 (DB에 존재하는 계정이어야 합니다)
const USERNAME = 'test';
const PASSWORD = 'password'; 

export function setup() {
  // 1. 로그인하여 토큰 발급
  const payload = JSON.stringify({
    username: USERNAME,
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
    console.error('Login failed:', loginRes.body);
    return { token: null };
  }

  const token = loginRes.json('accessToken');
  const memberId = loginRes.json('memberId');
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
  }

  sleep(1); // 1초 대기
}
