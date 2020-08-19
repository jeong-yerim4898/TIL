# Django

Django 3.1

`pip list`

- 장고 설치하기

  ```django
  pip install django
  
  #특정 버전으로 받고 싶다.
  pip install django==3.0.8
  ```

  

- 장고 시작하기

  ```django
  django-admin startproject fist_webex
  ```

  - `first_webex`라는 이름으로 폴더가 생성.

    - 여기 안에는 `first_webex` 폴더와 `manage.py` 생성 되어짐.

      - first_webex : 프로젝트 설정 파일들이 들어있음.

      - manage.py :  장고 명령어를 실행하기 위한 파일.

        `python manage.py` 장고명령어

    - 가장 바깥에 있는 프로젝트 폴더명은 수정 가능하나, setting 파일이 들어 있는 폴더명은 건들이지 말자.

- 장고 실행하기

  ```django
  python manage.py runserver
  ```

  

JSON 파일

​	파이썬의 딕셔너리와 구조가 똑같다.

​	{key:vaule}

단, 차이점은 json은 binary 형식으로 저장된다.

(쉽게 말하면 문자열로 저장이 된다. 더 쉽게 말하면 10 vs '10')



- 장고 프로젝트는 Application의 집합체로 동작
  - 실제로 어떠한 역할을 해주는 친구가 바로 app.
  - 하나의 프로젝트는 여러개의 어플리케이션을 가질 수 있음.
    - 어플리케이션 : 하나의 역할 및 기능 단위로 쪼개진 형태.
      - 예시) 회원관리/ 글 작성, 수정, 삭제/ 데이터를 수집 분석/ ...
      - 어플리케이션을 이렇게 나눠야 한다와 같은 기준은 없음.
      - 작은 프로젝트라면 어플리케이션을 따로 나누지 않아도 된다.

- 어플리케이션 생성

  ```django
  python manage.py startapp 앱이름(북수형)
  ```

  - 해당 앱 이름으로 폴더가 생성됨. (앱 폴더)
  - **바로 할일이 있다!!!!!!!!(안하면 1000%로 까먹음)**
    - `settings.py`에 내가 생성한 app을 등록해줘야 함.
    - `install.app`에 가장 윗줄에 등록해 준다.
    - language_code='ko-kr'
    - time_zone = 'Asaia/Seoul'


## 이제 부터는 서버를 동작하기 위한 단계

- MTV (**MVC 패턴**) *면접에서도 많이 물어봄*

  - Model : 장고에서 Modle

    View : 장고에서 Template

    Controller : 장고에서 View

- 3대장 : 우리가 가장 밀접하게 수정해야 하느 파일명
  1. urls.py
  2. views.py
  3. templates (html 들)

- urls.py에서 해야할 일

  **path('url 패턴/', 실행이 되어야 하는 views에 있는 함수,  해당 path의 별명)**

  - 많이 놓치는 부분 : url 패턴뒤에 / 많이 빠트림



- views.py에서 해야할 일
  - 함수를 정의 (첫 번째 인자로 request 필수!!! 꼭 !! 필수!!!)
  - **return은 꼭필요**
    - render :주로 remplate과 함께 response할 때 사용되는 함수.
- template에서 해야할 일
  - 폴더 명은 반드시 `templates`인 것을 확인



## 여기까지가 기본 수정할 파일들 조작 방법

### 여기서 부터는 본격 장고 동작 정의 방법

- Template Variable

  - html과 같은 template에서 views.py에서 준비한 변수를 가져다가 쓰는 방법

  - render() 세번빼 인자로 `{key : value}`와 같이 딕셔너리 형태로 넘겨주면 template에서 key를 이용하여 value를 가져올 수 있다.

  - ```python
    context = {'key':value}
    return render(request,'index.html',context)
    ```

    ```html
    {{ key }} 이렇게 value를 보여줄 수 있다.
    ```

  

- Variable Routing(동적 라우팅)

  - url 주소 일부를 변숴럼 사용해서 동적인 주소를 만드는 것

    주소요청 : `s://127.0.0.1:8000/hello/문자열`

    url.pu

    ```python
    path('hello/<str(타입):name(저장되는 변수명)>',views.hello),
    ```

    views.py

    ```python
    def hello(request,name(저장되는 변수명)):
        print(name)
        context= {
            'name':name,
        }
        return render(request,'hello.html',context)
    ```

    template (hello.html)

    ```html
    <body>
    이름은 : {{ name }} # context와 key값을 사용하면 value를 출력한다.
    </body>
    ```



- DTL (tag와 filter)

  - 로직을 표현 할 때는 : `{% for %}`

  - 값을 표현 할 때는 : `{{ }}`

  - 주석으로 나타내고 싶을 때는 : `{# #}` or `{% comment%} 주석할 내용 {%endcomment %}`

    ```html 
    <!-- <h1>{#{ i * 2 }#}</h1> -->
    {% comment%} <h1>{#{ i * 2 }#}</h1> {%endcomment %}
    ```

  - for 태그

    - 반복을 위한 태그

      ```python
      {% for 임시변수 in iterable한 객체 %}
      {% endfor %}
      ```

      

    - for empty

      ```python
      {% for 임시변수 in iterable한 객체 %}
      	값이 하나라도 있으면 여기가 실행
      {% empty %}
      	출력할 값이 없으면 출력.
      {% endfor %}
      ```

  - if 태그

    - 조건을 구분하기 위한 태그

      ```python
      {% if 조건문 %}
      {% elif 조건문 %}
      {% else %}
      {% endif %}
      ```

  - 나머지 기타 유용한 dtl 문서를 참고. (구글에서 찾을 때 바로 찾는 키워드 **django built in template**)



- Form

  - HTML form tag 의미

  - 입력 받은 데이터를 어딘가로 보낼 떄 사용.

    ```html
    # action : 보내려는 코드 #method : http method
    <form action="" method="GET"> 
        
        # 오락실 버튼
        <input type="button">
        
        # 미사일 버튼
        <input type="submit">
        		or
        <button></button>
        
    </form>
    ```

    - **action에 들어가는 목표 url 설정 주의 사항!**

      ```html
      acton="/catch/"
      ==> 127.0.0.1:8000/catch?name=adsf
      
      현재주소 : 127.0.0.1.8000/index
      action="catch/"
      ==> 현wo주소/catch?name=adsf
      ```

      