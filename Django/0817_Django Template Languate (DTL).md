# Django Template Languate (DTL)

- django template system에서 사용하는 built-in template systme이다.
- 조건, 반복, 치환, 필터 , 변수 등의 기능을 제공.
- 프로그래밍 로직(views.py)이 아니라 프레젠테이션을 표현하기 위한 것





### syntax

- variable : `{{}}`
- filter : `{{ variablefiler }}`
- tags : `{% tag%}`



## 템플릿 시스템 설계 철학

- 장고는 템플릿 시스템이 `표현`을 제어하는 도구이자 표현에 관련되 로직일 뿐이라고 생각한다.
- 템플칫 시스템에서는 이러한 기본 목표를 넘어서는 기능을 지원해서는 안된다.