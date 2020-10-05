# REAT API

## API 서버

- 프로그래밍 언어가 제공하는 기능을 수행할 수 있게 만든 인터페이스

- 결과적으로는 우리가 만든 서버에서 HTML이 아니라 JSON 응답으로 데이터를 제공.



## RESTful API

### REST

- REpresentational State Transfer

- 로이 필딩 2000년 박사 논문으로
- 자원과 주소로 표현하는 방법론
  - 웹 상에 존재하는 자료를 HTTP 위에서 전송하기 위한 인터페이스

- 자원 (URI로 표현)
  - URL
  - URN
- HTTP method로 주소 표현
  - GET : 데이터를 조회
  - POST : 데이터를 생성
  - PUT(전체) / PATCH(일부) : 데이터를 수정
  - DELETE :데이터를 삭제
  - 