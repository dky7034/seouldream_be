### API 변경사항 안내: 대시보드 연령별 현황

**1. 변경 목적 및 정책**
*   클라이언트의 새로운 요구사항에 따라, 대시보드의 '연령별 현황' 집계 방식이 변경되었습니다.
*   **신규 정책**: "한국 나이 28세 이하"는 **'대학부'**로, "29세 이상"은 **'청년부'**로 구분합니다. 이 기준은 매년 자동으로 갱신됩니다.

**2. API Endpoint**
*   `GET /api/dashboard` (기존과 동일)

**3. 응답(Response) 데이터 변경 상세**
*   API 응답 본문의 `demographics` 객체 구조가 다음과 같이 변경됩니다.

**기존 구조:**
```json
"demographics": {
    "count10sAndUnder": 1,
    "count20s": 15,
    "count30s": 8,
    "count40sAndOver": 2,
    // ... other fields
}
```

**신규 구조:**
```json
"demographics": {
    "countDaehak": 16,      // 대학부 (28세 이하)
    "countCheongnyeon": 10, // 청년부 (29세 이상)
    // ... other fields
}
```

**4. 프론트엔드 조치 사항**
*   대시보드 UI에서 기존의 '10대 이하', '20대', '30대', '40대 이상'으로 표시되던 부분을 **'대학부'**와 **'청년부'**로 변경하고, 각각 `countDaehak`, `countCheongnyeon` 필드의 값을 사용하도록 업데이트해야 합니다.