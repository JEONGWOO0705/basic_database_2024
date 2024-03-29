# basic_database_2024
IoT 개발자 과정 SQL Server 학습 지포지토리

## 1일차
- MS SQL Server 설치 : https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads 최신버전
    - DBMS 엔진 - 개발자버전
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화 후 진행

        ![기능선택](https://github.com/JEONGWOO0705/basic_database_2024/blob/main/images/db001.png?raw=true)
        - 데이터베이스 엔진구성부터 중요
            - Windows인증모드로 하면 외부에서 접근불가
            - 혼합모드(sa)에 대한 암호를 지정 / mssql_p@ss (8자이상 [대소문자구분] 특수문자1자이상 포함)
            - 데이터루트 디렉토리는 변경
    - 개발툴 설치
    - [개발툴 설치](https://learn.microsoft.com/ko-kr/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
        - SSMS(Sql Server Management Studio) DB에 접근, 여러개발 작업할 툴


- 데이터베이스 개념
    - 데이터를 보관, 관리, 서비스하는 시스템
    - Data, Information, Knowlege 개념
    - DBMS > Database > Data(Model)

- DB언어
    - SQL(Structured Query Language) : 구조화된 질의 언어
        - DDL(Data Definition Lang) - 데이터베이스, 테이블, 인덱스 생성
        - DML(Data Manipulation Lang) - 검색(SELECT), 삽입(INSERT), 수정(UPDATE), 삭제(DELETE) 등 기능 제공
        - DCL(Data Control Lang) - 권한, 트랜스액션 부여/제거 기능

- SQL 기본 학습
    - SSMS 실행

    ![SSMS 로그인](https://github.com/JEONGWOO0705/basic_database_2024/blob/main/images/db002.png?raw=true)

- DML 학습
    - SQL 명령어 키워드 : SELECT, INSERT, UPDATE, DELETE 
    - IT개발 표현언어 : Request, Create, Update, Delete (CRUD로 부름. CRU개발 뜻은 INSERT, UPDATE, SELECT를 할 수 있는 기능을 개발해라 라는 뜻)
    - SELECT
        ```sql
        SELECT [ALL|DISTINCT] 속성이름(들)
          FROM 테이블 이름(들)
         [WHERE 검색조건(들)]
         [GROUP BY 속성이름(들)]
         [HAVING 검색조건(들)]
         [ORDER BY 속성이름(들) [ASC|DESC]]
        ```
    - SELECT 문 학습
        - 기본, 조건검색 학습 중
## 2일차
- Database 학습
    - DB 개발시 사용할 수 있는 툴
        - SSMS(기본)
        - Visual Studio - 아무런 설치 없이 개발 가능
        - Visual Studio Code -  SQL Server(mssql) 플러그인 설치하고 사용
    - ServerName(host) - 자기 컴퓨터 이름 (DESKTOP-QO2E9L6) | ip주소 | localhost(LoopBack URL)| 127.0.0.1(LoopBack IP) 중에서 선호하는거 아무거나!!
    - VS Code에서 DB개발하기
    - 관계 데이터 모델
        - 릴레이션 : 행과 열로 구성된 테이블(관계 데이터 모델에서만)
            - 행(튜플),열(속성), 스키마, 인스턴스 용어
        - 매핑되는 이름 테이블 (실제 DB)
            - 행(레코드), 열(컬럼,필드), 내포(필드명), 외연(데이터)
        - 차수(degree) : 속성의 개수
        - 카디날리티(acrdinality) : 튜플의 개수

        - 릴레이션 특징
            1. 속성은 단일값을 가진다.
            2. 속성은 다른 이름으로 구성
            3. 속성의 값은 정의된 도메인값만 가짐
            4. 속성의 순서는 상관없음
            5. 릴레이션 내 중복된 튜플 허용안함 (같은 책 정보를 두번 넣을 수 없음)
            6. 튜플 순서는 상관없음

        - 관계 데이터 모델
            - 릴레이션(Relation)
            - 제약조건(Constraints)
            - 관계대수(Relational algebra)

- DML 학습
    - SELECT 문
        - 복합조건
        - 집계함수와 GROUP BY