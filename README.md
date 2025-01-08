**주요 기능**

언어 전환 기능: 한글과 영어 간 전환이 가능하며, LanguageManager 클래스를 통해 구현되었습니다.

이메일 인증을 기반으로 한 아이디 찾기 기능: 사용자가 이메일 인증 코드를 통해 아이디를 찾을 수 있는 기능입니다.

회원가입 기능: 사용자 정보를 입력받아 데이터베이스에 저장하며, 비밀번호는 JBCrypt 라이브러리를 사용해 암호화됩니다.

회원탈퇴 기능: 사용자의 수강 기록 및 계정 정보를 데이터베이스에서 삭제합니다.

학점 제한 기능: 학과별 수강신청 가능한 최대 학점을 제한하는 로직이 포함되어 있습니다.

이메일 발송 기능: ServerA 프로젝트의 Aspect 패키지 내 sendEmail 메서드를 수정하여 이메일과 비밀번호 정보를 입력한 후, SMTP 기능을 활성화해야 동작합니다.

데이터베이스 구성

MySQL 데이터베이스를 사용하며, 아래와 같이 테이블이 구성되어 있습니다.
![image](https://github.com/user-attachments/assets/a343ec91-331d-4200-b288-bd57bf561a20)


src 폴더 내 덤프파일을 참조하여 데이터베이스를 구성하면 됩니다.

**클라이언트 및 서버 종속성**

**클라이언트**

fasterxml.jackson.core.databind: JSON 데이터 관리.

formdev.flatlaf: UI 테마 관리.

mysql-connector-j-9.1.0: MySQL 데이터베이스 연결.

ALMS_Lib: RMI와 데이터 객체 관리를 위한 라이브러리.



**서버**

sun.mail.javax: 이메일 발송 기능.

de.svenkubiak.jBCrypt: 비밀번호 암호화.

mysql-connector-j-9.1.0: 데이터베이스 연동.

ALMS_Lib: 공통 라이브러리로 클라이언트와 서버 간 데이터 교환 지원.



**코드 분석 및 구조 설명**

**클라이언트 (ClientA)**

데이터 교환:

remoteInterface로 서버의 메서드 호출.

valueObject를 사용하여 서버와 데이터를 주고받음.



**서버 (ServerA)**

로직 처리:

control 패키지에서 클라이언트 요청 처리.

model 패키지에서 DAO를 사용해 데이터베이스와 연동.


보안:

비밀번호는 JBCrypt로 암호화.

SMTP를 사용해 이메일 인증 코드를 전송.


**통신 방식**

Java RMI를 사용해 클라이언트-서버 간 원격 메서드 호출을 구현.
