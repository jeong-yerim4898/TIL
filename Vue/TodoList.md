## 흐름

- 가상환경 설정

- startproject

- start app

  - 기본세팅

  - modeling

  - DRF 사용준비

    - `pip install djangorestframework`

    - ```
      INSTALLED_APPS = [
          ...
          'rest_framework',
      ]
      ```

  - serializer작성

- Todod의 모든 list를 보여주는 R

  - GET :모든정보 조회
  - DB에서 모든 정보 불러온다
  - DFR를 통해서 JSON으로 리턴

- Todo를 생성할 수 있는 C

  - POST : 정보를 생성

  - 받을 데이터를 검증한다. (validation 한다.)

  - DB에 저장한다.

  - 저장된 정보를 JSON 형태로 리턴한다.

  - **update와 create에서의 serializer 인스턴스**

    ```
    # .save() will create a new instance.
    serializer = CommentSerializer(data=data)
    
    # .save() will update the existing `comment` instance.
    serializer = CommentSerializer(comment, data=data)
    ```

- Todo를 수정할 수 있는 U

  - PUT : 데이터 수정

  - 수정되어야 하는 데이터를 DB에서 찾아온다.

  - serializer를 이용해서 수정할 데이터와 수정 값을 담아둔다.

  - serializer를 유효성 검사한다.

  - db에 저장하고 저장된 값을 리턴한다.

    ```python
    todo = get_object_or_404(Todo,pk=todo_pk)
        if request.method=='PUT':
            serializer = TodoSerializer(todo,data=request.data)
            if serializer.is_valid(raise_exception=True):
                serializer.save()
                return Response(serializer.data)
    ```

    

- Todo를 삭제하는 D

  - DELETE : 데이터 삭제
- db에서 삭제할 데이터를 가져온다.
  - 삭제한다.
  - 삭제한 데이터의 id를 return 한다.

**백엔드 1차 마무리**

***

- `vue create clinet`로 vue project만들기

- router 사용

- HOME.vue ,About.vue 정리

- TodoList.vue TodoCreate.Vue 생성

- Todo Create.vue

  - input, button이 들어있는 화면 구성

  - axios를 이용해서 console.log(res.data) 확인

    - ```
      python -m pip install django-cors-headers
      ```

      **settings.py**

    - ```
      INSTALLED_APPS = [
          ...
          'corsheaders',
          ...
      ]
      ```

    - ```
      MIDDLEWARE = [
          ...
          'corsheaders.middleware.CorsMiddleware',
          'django.middleware.common.CommonMiddleware',
          ...
      ]
      ```

    - ```python
      CORS_ALLOWED_ORIGINS = [
          'http://localhost:8080',
      ]
      ```

  - `npm i axios` axios 설치

- TodoLIst.vue

  - getlist클릭시 axios get요청으로 응답하기
  - 페이지가 로딩 될 떄 같이 보여주는거 (Life Cylce hook 중에서 created를 활용하기)
  - update.vue
  - delete.vue

- Singup.vue
  - username,pw1, pw2
- Login.vue