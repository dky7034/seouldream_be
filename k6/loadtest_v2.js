import http from 'k6/http';
import { check, sleep } from 'k6';
import { Rate } from 'k6/metrics';

// 실패율 사용자 정의 지표
export let errorRate = new Rate('errors');

export let options = {
    // 스파이크 테스트 (Spike Test) 설정
    stages: [
        { duration: '1m', target: 100 },  // 1. 1분 동안 100명까지 워밍업
        { duration: '30s', target: 500 }, // 2. 30초 만에 500명으로 급격히 증가 (트래픽 폭주 상황)
        { duration: '3m', target: 500 },  // 3. 500명 상태로 3분간 지속 (서버가 버티는지 확인)
        { duration: '1m', target: 0 },    // 4. 서서히 종료
    ],
    thresholds: {
        errors: ['rate<0.1'], // 에러율 10% 미만 (500명이면 에러가 날 확률이 높으므로 관대하게 설정)
        http_req_duration: ['p(95)<3000'], // 95% 요청이 3초 이내면 성공으로 간주
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
