# Vue Directive

```html
<div id="app"></div>

<!-- vue CDN 추가 -->
<script>
	const app = new Vue({
        el : "#app", // 어떤 엘리먼트와 연결할지 정함.
        data : { // Model에 해당하는 부분
            // vue에서 사용되는 변수들
            // object형식이므로 key value형태로 넣어줘야한다.
            // 숫자, string, array, function 등등 다양항 타입 저장 가능하다.
        },
        methods : {
            // vue에서 사용하는 함수들 저장
            // s 뺴먹지 말기
            // 메소드를 정의 할 때는 화살표 함수(=>)를 사용하지 않는다. (this)
            // 화살표 함수를 사용하면 밖에 있는 데이터를 가르키기 때문에 methods안에 있는 데이터를 가져오지 못한다.
        }
    })
</script>
```



- v-html
  - innerHTML로 할당 
  - HTML 정보를 그대로 읽기 때문에 XSS 공격에 취약하다.
- v-text
  - inner Text로 할당
  - {{  }} (=머스타치): 보간법 (interpolation)
- v-if,v-if-else,v-else
  - 조건문에 따라서 해당 Tag의 렌더링 여부를 결정.
  - 아예 코드자체가 렌더링 되지 않는다 . cf) v-show
  - v-if,v-else를 사용할 때 사이에 어떠한 Tag가 있으면 제대로 동작하지 않는다.
- v-show
  - v-show의 값에 따라 display 속성을 조절해서 화면 노출을 결정한다.

- v-for

  - 반복문

- v-bind

  - HTML 표준속성에 Vue의 데이터를 연결

  - `:`  (short cut)

  - Object 형태 (key-value)로 사용하면 value가 True인 경우만 바인딩 된 값으로 할당 가능.

    `:class  ="{ 클래스 이름:false }"` 

- v-model
  - 양방향 바인딩
  - 입력되어지는 태그 (Input,TextArea, Select)사용
- v-on
  - 이벤트
  - `@` (short cut)



- this 정리

  - obj.functionCall() => this  === obj : 메소드 호출이되었을 때

  - 그 외 => this === window

    

    ```javascript
    const myObj = {
        myFunc : function() {
            console.log(this) // myObj
            //1. 콜백 함수에서 this를 obj로 만드는 방법 (.bind)
            axios.get(URL)
            	.then(function () {
                	console.log(this) // window
            }.bind(myObj)) // window를 myObj로 젼경가능
            
            //2. 콜백 함수에서 this를 obj로 만드는 방법 (=>)
            axios.get(URL)
            	.then(() => {
                	console.log(this) //myObj
            })
        }
    }
    ```

    

# Computed & watch

## Computed

- 값을 캐싱하기 때문에 값이 변하지 않으면 기존에 계산된 값(캐싱된 값)을 사용.

- x + 2 (x=1)  =3/

- 특정한 데이터를 직접적으로 가공하며 다른 값으로 만들어 사용할 때 주로 사용.

  `반갑습니다. 00시 입니다.` 지역만 바뀌면 변경

- 최종 데이터 형식이 정해져 있고 변경된 값은 항상 최종 데이터 형식을 가지기 때문에 `선언형` 프로그래밍

***

## watch

- 데이터가 변경이 되는지 지켜보고 변경이 된다면 특정 함수를 실행.

- 특정한 데이터의 변화에 따라서 다른 데이터 혹은 환경 등을 변화 시켜야 하는 경우

  `00시의 날씨는 00 입니다.` 각 지역에 따른 날씨 데이터가 또 필요할 때 사용 (지역에 따라 날씨 데이터 변화)

- `명령형` 프로그래밍