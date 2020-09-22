-- 한줄 주석
/*여러줄 주석*/

-- 테이블 정보 조회
SELECT * FROM classmates;

--data 임력 (CREATE)
INSERT INTO classmates (name,age)
VALUES ('홍길동',23);

-- 모든 컬럼을 입력 할 때는 컬럼명 생략가능
INSERT INTO classmates
VALUES ('홍길동',30,'서울');

-- 컬럼의 위치는 변경 가능 단 value도 위치 확인
INSERT INTO classmates (age,name)
VALUES (23,'홍길동');

-- id를 보고 싶을 떄
SELECT rowid, * FROM classmates;


-- Table 다시 정의 (id,not null)적용 버전
-- 기존 테이블 삭제
DROP TABLE classmates;

-- 테이블 재 정의
CREATE TABLE classmates (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
age INT NOT NULL,
address TEXT NOT NULL
);

-- rowid를 사용하기 위해 우리가 정의한 id삭제
CREATE TABLE classmates (
name TEXT NOT NULL,
age INT NOT NULL,
address TEXT NOT NULL
);

-- INSERT INTO로 값을 한번에 넣는 방법
INSERT INTO classmates VALUES ('홍길동',30,'서울'),('김철수',23,'대전'),
('박나래',23,'광주'),('이요셉',23,'구미');

.mode csv
.import hellodb.csv examples
-- classmates에서 id와 name을 가져오고 싶다면
SELECT rowid, name FROM classmates;

-- 원하는 레코드 갯수 만큼 가져올려면
SELECT rowid, name FROM classmates LIMIT 2;

-- classmates에서 3번쨰 있는 값 하나만 가져오고 싶다면
-- 인덱스는 0부터
SELECT rowid, name FROM classmates LIMIT 1 OFFSET 2;

-- 주소가 서울인 사람만 가져오고 싶다면
SELECT rowid, name FROM classmates WHERE address='서울';

-- age값을 중복없이 가져오기
SELECT DISTINCT age FROM classmates;

-- 중복 불가능한 rowid를 기준으로 삭제하자
-- id가 4일 레코드를 삭제하자
DELETE FROM classmates
WHERE rowid=4;

--- id가 4번인 레코드의 이름은 홍 주소는 제주도
UPDATE classmates SET name="홍", address="제주도" WHERE rowid='4';

-- age가 30 이상
-- 선행 되어야 할게 users.csv 파일이 db와 같은 장소에 있어야 핬다.
-- squlite에서 사용하는 dot command
.tables # 모든 테이블 확인
.mode csv # 현재보여지는 형태를 csv
.import users.csv users
SELECT * FROM users
.schema users;
SELECT * FROM users WHERE age>=30;


-- 나이가 30 이상이고 성이 김인 사람의 성과 나이만 가져오면?
SELECT age, last_name FROM users WHERE age>=30 and last_name='김';

-- 테이블의 모든 레코드의 개수
SELECT COUNT(*) FROM users;

-- 펻균
-- 30살 이상의 평균 나이
SELECT AVG(age) FROM users WHERE age>=30;

-- 계좌 잔액이 가장 높은 사람과 액수
SELECT MAX(balance), first_name FROM users;

-- 30살 이상인 사람의 계좌 평균 잔액
SELECT AVG(balance) FROM users WHERE age>=30;

-- 20대인 사람은?
SELECT * FROM users WHERE age LIKE'2_';

-- 지역번호가 02인 사람
SELECT * FROM users WHERE phone LIke'02_%';

-- 이름이 '준'으로 끝나는 사람
SELECT * FROM users WHERE first_name LIKE'%준';

-- 중간번호가 5114인 사람 
SELECT * FROM users WHERE phone LIKE'%_5114_%';

-- 나이순으로 오름차순 정렬하여 상위 10개만
SELECT * FROM users ORDER BY age ASC LIMIT 10;

-- 나이순, 성 순으로 오름차순 정렬하여 상위 10개
SELECT * FROM users ORDER BY age,last_name ASC LIMIT 10;

-- 계좌잔액순 내림차순 해당하는 사람의 성과 이름 10개
SELECT first_name, last_name FROM users ORDER BY balance DESC LIMIT 10;

-- GROUP BY
-- 각 성이 몇 명씩 있는지 조회
SELECT last_name,COUNT(last_name) FROM users GROUP BY last_name;
SELECT last_name,COUNT(*) AS name_count FROM users GROUP BY last_name;
-- ORDER BY랑 같이 사용하지 못함

-- ALTER
-- 