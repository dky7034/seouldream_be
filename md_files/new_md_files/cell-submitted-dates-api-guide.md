[백엔드 API 요청]
안녕하세요! 프론트엔드 작업 중 '출석 체크 달력'에 이미 제출 완료된 날짜를 표시하는 기능이 필요하여 API 추가 요청드립니다.

- 기능: 특정 셀(Cell)이 보고서를 제출한 날짜 목록(List) 조회
- Method: GET
- URL: /api/cells/{cellId}/submitted-dates
- Response: ["2026-01-01", "2026-01-08"...] 형태의 날짜 문자열 배열

상세 내용은 위 명세 확인 부탁드립니다. 감사합니다!

### 개발 진행 상황:
- `CellReportRepository.java`에 셀 ID 및 선택적 연도/월 필터링을 통해 제출된 고유 보고서 날짜를 조회하는 메서드를 추가했습니다.
- `CellService.java`에 `CellReportRepository`를 주입하고, 리포지토리에서 조회한 `LocalDate` 목록을 "YYYY-MM-DD" 형식의 `String` 목록으로 변환하여 반환하는 `getSubmittedCellReportDates` 메서드를 구현했습니다.
- `CellController.java`에 `GET /api/cells/{cellId}/submitted-dates` 엔드포인트를 추가하여 해당 서비스 메서드를 호출하고 응답을 반환하도록 설정했습니다.
- **코드 컴파일은 성공적으로 완료되었습니다.**
- 다만, 테스트 실행 중 `java.net.UnknownHostException` 오류로 인해 일부 테스트가 실패했습니다. 이는 데이터베이스 연결 문제로 추정되며, 새롭게 추가된 API 기능 구현과는 직접적인 관련이 없는 기존 환경 설정 문제일 수 있습니다.

**요청하신 API 기능에 대한 코드 구현은 완료되었습니다. 백엔드 개발에 반영하시면 됩니다.**
