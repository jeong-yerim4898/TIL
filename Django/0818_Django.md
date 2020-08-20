# Django

python을 기반으로 하는 웹 백엔드 프레임워크

### 장고 설치 방법

`pip install django`

- 버전 : pip lit (django 3.1 확인)

### 장고 프로젝트 생성

`django-admin startproject 프로젝트명`

- 프로젝트 폴더명으로 설정파일이 저장되는 폴더와 manage.py 파일 생성

- 외부 프로젝트 폴더명은 수정가능 하지만 내부 설정파일 폴더는 폴더명 수정 불가.

- 프로젝트 생성 완료하면 항상 manage.py가 있는 위치로 이동

  `No such File`

- `python manage.py runserver`를 실행하여 로켓을 보면 됨.

  (app이 등록되면 볼 수 없음. 로켓이 보이면 무사히 실행된다는 의미)



### 장고 앱 생성

`python manage.py startapp 앱이름(복수형 권장)`

- 애 생성 후 필히!!! `setting.py` 파일에 등록
- language_code, time_zone : 한국에 맞춰서 수정



****

## 프로젝트의 흐름

### MTV 패턴(MVC 패턴)

- Model (Model) : DB관리
- Template (View) : 보여지는 페이지 관리
- View ( Controller) : 데이터를 어떻게 처리하고 관리



- 3대장
  - `urls.py`
  - `views.py`
  - `models.py`

- 코드의 작성흐름 (흐름을 잊지 말자.)
  - urls.py -> views.py -> template
  - 어디에서 주소를 결정하는지!!(urls)
  - 요청이 들어오면 어떤 파일을 거치게 되는지
  - 어디에서 새로운 페이지를 만들며 되는지 (templates 폴더)

***

- Template Variable

  - render() 사용할 때 views.py에서 정의한 변수를 template 파일로 넘겨서 사용하는 것.

  - render() 의 세번째 인자로 dictionary 형태로 값을 넘겨준다.

    여기에 key에 해당하는 문자열이 template에서 사용 가능한 변수명이 된다.

  - dicitonary 형태로 직접 전달하는 것 보다 `context`라는 변수를 사용해서 넘기는 것이 일반적.

***

- Variable Routting

  - 동적 라우팅 : URL 주소일부에 변수처럼 값을 전달하는 동적인 주소를 만드는것.

  - 왜 사용할까?

    - hi/justin, hi/john 같이 다양한 사람들과 인사하는 함수를 작성할 때.

      - 동적 라우팅을 쓰지 않으면 `urls.py`에 일일히 등록해줘야함.

        - 인원이 많아지거나 누구한테 인사해야할지 모를때 고정적인 방법은 사용하기 어렵움.

      - 동적 라우티을 사용하면 뒤에 사람이름을 변수화 할 수 있다.

        - `hi/<str.name>` 형식으로 나타낼 수 있음.

        - `views.py`에서 함수를 정의할 때 인자로 꼭 variable routing에서 선언한 변수명을 받아야 한다.

      - 변수로 사용 할 수 있는 type의 종류

        - 구글에 아래 키워드 검색
        - `django url dispatcher` : 동적 라우팅에 대한 내용. path converters 통해 type볼수 있다.

***

- Django Template Languate (DTL)

  - django template에서 사용하는 내장 template system
    - 조건, 반복, 변수 치환, 필터 등의 기능을 제공
    - 로직을 표현 할 때 : `{% %}`
    - 값을 표현 할 때 : `{{ }}`
    - 주석을 표현 할 때 : `{# #}` and  `{% comment %} {% endcomment %}`

  - for  문

    - `{% for 임시변수 in < view로부터 전달받은 iterable한 변수명> %} {% endfor %}`

      ```django
      {% for menu in menus %}
      	<p> {{for loop.counter0 }} {{ menu }} </p>
      {% empty %}  # menus가 없을 때 (텅 비어있을 때)
      	<p> 메뉴가 없습니다.</p>
      {% endfor %}
      ```

  - if 문

    ```django
    {% if 조건문 %}
    {% elif 조건문1 %}
    {% else %}
    {% end if %}
    ```

    - 조건 연산자 사용 가능

      ```
      <=
      >=
      ==
      !=
      >
      <
      in
      not in
      is
      ```

***

- Form

  - HTML에서 form tag
  - 입력받은 데이터를 어딘가로 전송할 때 사용

  ```html
  <form action="" method="">
      <input type="text" name="데이터명">
      <input type="radio" name="데이터명">
      ...
      <input type="button"> # 오락실과 같은 버튼
      
      <input type="submit">
      <button>
          보내기
      </button> # button 태그도 submit 역할을 한다.
  </form>
  <input type="text"> # form 내부 친구들과 같이 전송되지 않음.
  ```

  - action : 데이터를 보내려는 목적지 주소

    - action="/catch/" : `localhost:8000/catch/`
    - action="catch" : `현재주소/catch/`

  - mehod : http method(GET,POST)

    - GET : 주소에 query string 형식으로 데이터를 전달하는 방식, (정보를 조회 할 때 주로 사용)

      `localhost:8000/catch/?데이터명=데이터값&데이터1명=데이터1값&...`

  - `request` 라는 장고 함수 선언할 때 넣어주었던 인자에 유저가 요청한 값이 들어있음.





### 탬플릿 확장하기

1. base.html 생성하기
2. base.html을 setting.py에 등록하기
3. 상속하려는 탬플릿에서 첫번째 줄에 {% extends 'base.html' %} 선언하기
4. {% block 블력명 %} {% exdblock %} 사이에 코드 작성하기.