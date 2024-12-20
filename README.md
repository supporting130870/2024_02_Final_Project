명지대학교 인문캠퍼스 2024년도 2학기 객체지향적사고와 프로그래밍 (최성운 교수님) 기말프로젝트입니다.

주요기능
- 언어전환기능(한영전환가능)
- 이메일 인증코드를 기반으로 한 아이디 찾기 기능
- 회원가입기능
- 회원탈퇴기능
- 학점제한

이메일 발송기능이 동작하려면 ServerA 프로젝트 내에 Aspect패키지에 존재하는 sendEmail 코드에 이메일과 비밀번호 정보를 입력한 후, stmp기능을 설정해주서야합니다.

데이터베이스로는 MySql을 사용했습니다.
테이블을 아래와 같이 구성했습니다.
src폴더 내에 덤프파일이 있으니 참조하면 됩니다.
+-----------------+----------------+--------------+-------------+----------------+------------+----------------+
| TABLE_NAME      | COLUMN_NAME    | COLUMN_TYPE  | IS_NULLABLE | COLUMN_DEFAULT | COLUMN_KEY | EXTRA          |
+-----------------+----------------+--------------+-------------+----------------+------------+----------------+
| campus          | id             | int          | NO          | NULL           | PRI        | auto_increment |
| campus          | name_kor       | varchar(50)  | NO          | NULL           |            |                |
| campus          | name_eng       | varchar(50)  | NO          | NULL           |            |                |
| campus          | parents_id     | int          | YES         | NULL           |            |                |
| college         | id             | int          | NO          | NULL           | PRI        | auto_increment |
| college         | parents_id     | int          | NO          | NULL           | MUL        |                |
| college         | name_kor       | varchar(100) | NO          | NULL           |            |                |
| college         | name_eng       | varchar(100) | NO          | NULL           |            |                |
| course          | id             | int          | NO          | NULL           | PRI        | auto_increment |
| course          | parents_id     | int          | NO          | NULL           | MUL        |                |
| course          | name           | varchar(100) | NO          | NULL           |            |                |
| course          | lecturer       | varchar(50)  | NO          | NULL           |            |                |
| course          | credit         | int          | NO          | NULL           |            |                |
| course          | time           | varchar(100) | NO          | NULL           |            |                |
| department      | id             | int          | NO          | NULL           | PRI        | auto_increment |
| department      | parents_id     | int          | NO          | NULL           | MUL        |                |
| department      | name_kor       | varchar(100) | NO          | NULL           |            |                |
| department      | name_eng       | varchar(100) | NO          | NULL           |            |                |
| student_courses | NAME           | varchar(45)  | NO          | NULL           |            |                |
| student_courses | ID             | varchar(45)  | NO          | NULL           | PRI        |                |
| student_courses | STUDENT_NUMBER | varchar(45)  | NO          | NULL           | PRI        |                |
| student_courses | LECTURER       | varchar(45)  | NO          | NULL           |            |                |
| student_courses | CREDIT         | varchar(45)  | NO          | NULL           |            |                |
| student_courses | TIME           | varchar(45)  | NO          | NULL           |            |                |
| student_courses | STATUS         | varchar(45)  | NO          | NULL           |            |                |
| user_info       | ID             | varchar(45)  | NO          | NULL           | PRI        |                |
| user_info       | PW             | varchar(120) | NO          | NULL           |            |                |
| user_info       | NAME           | varchar(45)  | NO          | NULL           |            |                |
| user_info       | PHONE_NUMBER   | varchar(45)  | NO          | NULL           | UNI        |                |
| user_info       | ADDRESS        | varchar(45)  | NO          | NULL           |            |                |
| user_info       | STUDENT_NUMBER | varchar(45)  | NO          | NULL           | PRI        |                |
| user_info       | EMAIL          | varchar(45)  | NO          | NULL           | PRI        |                |
| user_info       | CAMPUS         | varchar(45)  | NO          | NULL           |            |                |
| user_info       | COLLEGE        | varchar(45)  | NO          | NULL           |            |                |
| user_info       | DEPARTMENT     | varchar(45)  | NO          | NULL           |            |                |
+-----------------+----------------+--------------+-------------+----------------+------------+----------------+




아래에 해당하는 종속성을 추가해주어야 제대로 동작합니다.

ALMS_Lib의 경우는 remoteInterface와 ValueObject가 포함되어 있습니다

또한 이 파일은 소스 폴더 안에 넣어 두었습니다.

 

---------------------------------

---------------------------------

---------------------------------

클라이언트 종속성 추가 부분

 

fasterxml.jackson.core.databind

formdev.flatlaf

mysql-connector-j-9.1.0

ALMS_Lib

 

서버 종속성 추가 부분

sun.mail.javax

de.svenkubiak.jBCrypt

mysql-connector-j-9.1.0

ALMS_Lib
