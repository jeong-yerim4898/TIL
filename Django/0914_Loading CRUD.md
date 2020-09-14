# Loading CRUD

- 가상 환경 설정

  - `python -m venv venv`
  - vscode에서 interpreter 설정
  - 가상환경 실행
    1. vscode 새로운 실행
    2. source venv/Scripts/activate 실행
  - pip list 로 깨끗한지 확인.
  - `pip install django`

- 준비 단계

  - 프로젝트 생성
    - `django-admin startproject`실행
    - `manage.py` 가 있는 폴더로 이동
    - `python manage.py runserver`  로켓 확인
  - 앱 생성
    - `python manage.py startapp 앱이름`
    - 바로 `setting.py`열어서 앱 등록
  - url 분리 작업
  - 공통적으로 사용할 base.html 생성
    - 상단의 폴더에 templates폴더를 만들고 base.html 만든다
    - 그리고 settings.py 의 TEMPLATES에 BASE_DIR/'templates'를 작성해준다


****

- 간단한 페이지 작성방법!!!

  - `url -> views -> template` 루틴으로 모든 장고 기능 작성을 할 것임.

  - `html`에서 값을 보여주고 싶을 때는 `viels.py`에서 render의 세번째 인자로 dictionary 형태를 가지는 값을 넘겨 주면 됨. (변수 context으로 보통 전달함.)
    - html 에서 보여줄 때는 `{{보내는 키명 }}` 으로 나타낼 수 있다.
  - Variable Route
    - 주소 중 일부를 변수로 사용. 즉 패턴에 있는 주소 값을 변수에 저장 할 수 있다.
    - 즉, 내가 원하는 값을 주소로 전달 할 수 있다.
    - `urls.py` 에서는 주소 패턴에 `<타입:변수명>` 정의
      - str,int
      - `views.py` 에서는 함수 매개변수 명을 정해주는데 반드시 `urls.py`에서 설정한 변수명으로 해야함.

***

- Model 사용
  - class를 작성을 한다.
  - `python manage.py makemigrations` : DB 설계 도면을 생성 **내가하기**
  - `python manage.py migrate` :   DB 생성하기



- Admin 페이지 사용해보기
  - `admin.py`에 내가 만든 모델을 등록
  - 관리자 계정을 생성. `python manage.py createsuperuser`

***

- CRUD [Form은 없이]

  - Read
    - 전체 목록 읽어오기 (index)
      - Queryset형태로 데이터를 받아옴.
    - 하나의 목록만 읽어오기 (detail)
      - 해당 데이터의 pk값이 필요. => variable route를 이용해서 전달.
      - Object형태로 데이터를 받아옴.

  - Create
    - request method로 할일을 나누는데
      1.  링크를 누르거나 주소창에 주소를 입력했을 때 : GET
         - 입력할 수 있는 페이지를 보여주세요.
      2. 제출 버튼을 눌렀을 때 : POST
         - 데이터를 DB에 저장해 주세요.