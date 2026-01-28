import http from 'k6/http';
import { check, sleep } from 'k6';
import { Rate } from 'k6/metrics';
import { Trend } from 'k6/metrics';
import { SharedArray } from 'k6/data';

// 사용자 정의 지표
export let errorRate = new Rate('errors');
export let dashboardResponseTrend = new Trend('dashboard_response_time');

export let options = {
    stages: [
        { duration: '30s', target: 50 },  // 가볍게 50명까지
        { duration: '1m', target: 200 },  // 200명으로 증가
        { duration: '3m', target: 200 },  // 3분간 유지
        { duration: '30s', target: 0 },   // 종료
    ],
    thresholds: {
        'errors': ['rate<0.01'], // 에러율 1% 미만
        'dashboard_response_time': ['p(95)<1000'], // 95%가 1초 이내 응답 목표
    },
};

const BASE_URL = 'http://localhost:8080';

// 테스트 계정
const users = new SharedArray('users', function () {
    return [
        { username: 'user16', password: 'sdc!577695' },
    ];
});

export function setup() {
    const user = users[0];
    const loginPayload = JSON.stringify({
        username: user.username,
        password: user.password,
    });

    const params = { headers: { 'Content-Type': 'application/json' } };
    const loginRes = http.post(`${BASE_URL}/api/auth/login`, loginPayload, params);

    // 로그인 실패 시
    if (loginRes.status !== 200) {
        console.error(`Setup Login failed: ${loginRes.status}`);
        return { token: null, cellId: null };
    }

    const loginData = loginRes.json();
    return { token: loginData.accessToken, cellId: loginData.cellId };
}

export default function (data) {
    // Setup 실패 시 중단
    if (!data.token) {
        sleep(1);
        return;
    }

    const authParams = { headers: { 'Authorization': `Bearer ${data.token}` } };

    // === [테스트 시나리오: 대시보드 무한 조회] ===

    // 1. 대시보드 데이터 조회
    const dashboardRes = http.get(`${BASE_URL}/api/cells/${data.cellId}/dashboard-summary`, authParams);

    const dashboardSuccess = check(dashboardRes, {
        'dashboard status 200': (r) => r.status === 200
    });

    if (!dashboardSuccess) {
        errorRate.add(1);
        // 서버가 힘들어할 때 에러 로그 확인용
        // console.error(`Dashboard failed: ${dashboardRes.status}`);
    }
    dashboardResponseTrend.add(dashboardRes.timings.duration);

    // 2. (선택사항) 셀원 목록 조회 API도 같이 테스트하고 싶다면 추가
    // const memberRes = http.get(...)

    sleep(1); // 1초에 한 번씩 새로고침한다고 가정
}