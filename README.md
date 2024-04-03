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

    - 특이사항 : SSMS 쿼리창에 소스코드 작성시 빨간색 오류 밑즐이 가끔 표현(전부 오류는 아님!!)
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
            - 관계대수(Relational algebra)\
        
        - 키 : 릴레이션 내 튜플이 중복되지 않는것  ex) 주민번호, 고객번호

- DML 학습
    - SELECT 문
        - 복합조건, 정렬(ASC, DESC)
        - 집계함수와 GROUP BY
            - SUM(총합), AVG(평균), COUNT(개수), MIN(최소), MAX(최댓값)
            - 집계함수 외 일반 컬럼은 GROUP BY 절에 속한 컬럼만 SELECT문에 사용가능
            - HAVING 은 집계함수의 필터로 GROUP BY 뒤에 작성. WHERE절과 필터링이 다르다

        - 두개 이상의 테이블 질의(Query)
            - 관계형 DB에서 가장 중요한 기법중 하나 : JOIN!!
            - INNER JOIN(내부 조인)
            - LEFT | RIGHT OUTER JOIN(외부 조인) : 어느 테이블이 기준인지에 따라서 결과가 상이함

        ![외부조인](https://github.com/JEONGWOO0705/basic_database_2024/blob/main/images/db004.png?raw=true)

## 3일차 
- 관계 데이터 모델
    - 무결성 제약조건
    - 키 : 릴레이션 내 튜플이 중복되지 않는것  ex) 주민번호, 고객번호

        - 슈퍼키 : 튜플을 유일한 값으로 구분 지을 수 있는 속성 또는 속성 집합
            - 유일한 값으로 구분 지을 수 있는 속성, 또는 속성 집합 (고객번호 | 주민번호 | 고객번호/이름 | 고객번호/주소 | 고객번호/이름/전화번호)
            - 이름 하나로는 안됨!!
            - ex) 고객번호, 이름(but, 동명이인이 있을 경우 슈퍼키 불가), 고객번호 + 이름 (합쳐서도 슈퍼키로 가능), 주민번호

        - 후보키 : 튜플을 유일한 값으로 구분 지을 수 있는 최소한의 속성 집합
            - 주문 릴레이션에서는 고객번호, 주문번호가 동일한 것이 여러개로 구성되어있다.
            - 유일하게 식별 할 수 있는 속성 최소집합은 고객번호+주문번호 이다.
            - 다른 릴레이션에서는 고객번호, 주민번호 각각 후보키 가능(슈퍼키도 가능)

        - 기본키(Primary Key!) : 여러 후보키 중에서 하나를 선정하여 대표로 삼는 키 
            - 고려사항 : 고유한 값(Unique), NULL 불가 (Not Null), 최소 속성의 집합, 개인정보등의 보안사항은 사용 자제

        - 복합키 : 후보키 중 속성을 2개 이상 집합으로 한 키
        - 대리키 : 기본키가 여러개의 속성으로 구성되어 복잡하거나, 보안 문제가 생실때 새로운 키로 대체 
        - 대체키 : 기본키로 선정되지 않은 후보키
        - 외래키(Foriegn Key!): 기본키를 참조하여 사용하는 것
            - 고려사항 : 다른 릴레이션과의 관계, 다른 릴레이션의 기본키를 호칭, 서로 값은 값이 사용, 기본키가 변경되면 외래키도 변경!!!
            - NULL과 중복을 허용(NOT Null인 경우도 있음), 자기 자신의 기본키를 외래키로 사용 가능

        - ex)  (고객번호 | 주민번호 | 고객번호/이름 | 고객번호/주소 | 고객번호/이름/전화번호) 가 슈퍼키가 될 수 있다
        - ex)  그중에서 최소한의 속성 집합 (여기서는 1개의 속성) 으로 구분 지을 수 있는 값 (고객번호 | 주민 번호) 가 후보키가 될 수 있다.  
        - ex)  후보키 안에서 하나로 대표로 삼으면(고객번호 또는 주민번호 중 하나를 선택) 기본키가 된다.

    - 데이터 무결성(Interity) : DB에 저장된 데이터의 일관성과 정확성을 지키는 것
        - 도메인 무결성 제약 조건 : 데이터 타입, NOT NULL, 기본값, 체크 특성을 지키는 것
        - 개체 무결성 제약 조건: 기본키 제약 조건이라고 부름. Unique에 NOT NULL. (값이 중복되어도 안되고 빈칸도 안된다!!!)
        - 참조 무결성 제약 조건 : 외래키 제약 조건으로도 부름. 부모의 키가 아닌 값은 사용할 수 없음. 외래키가 바뀔때 기본키의 값이 아닌 것은 제약을 받는다.
            - RESTRICT(자식에서 키를 사용하고 있으면 부모 삭제 금지), CASCADE(부모가 지워지면 자식도 같이 삭제)
            - DEFAULT(부모가 지워지면 자식은 지정된 기본값으로 변경), NULL(부모가 지워지면 자식의 해당값을 NULL로 변경)
        - 유일성 제약 조건 : 일반 속의 값이 중복되면 안되는 제약 조건, NULL값은 허용.
         
        
- DML 학습
    - SELECT문 
        - JOIN 
            - OUTER JOIN(외부조인)
                -  LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 조건에 일치하지 않는 왼쪽테이블 데이터도 모두 표시

                - RIGHT OUTER JOIN: 오른쪽 테이블 기준으로 조건에 일치하지 않는 오른쪽 테이블 데이터 모두 표시

            - 부속 질의(Sub Query)
                - 쿼리 내에 다시 쿼리를 작성하는 것
                - 서브쿼리를 쓸 수 있는 장소
                    - SELECT : 한컬럼에 하나의 값만
                    - FROM : 가상의 테이블로 사용
                    - WHERE : 여러 조건에서 많이 사용

            - 집합 연산 : JOIN도 집합이지만 , 속성별로 가로로 병합하기 떄문에 집합이라 부르지 않음. 집합은 데이터를 세로로 합치는 것을 뜻함
                - 차집합 (EXCERT, 거의 사용안함) : 하나의 테이블에서 교집합 값을 뺸 나머지
                - 합집합 (UNION , 많이 사용) : UNION(중복제거), UNION ALL(중복허용)
                - 교집합 (INTERSECT, 거의 사용안함) : 두 테이블에 모두 존재하는 값
                - EXISTS : 데이터 자체의 존재 여부 


- DDL 학습
    - CREATE : 개체 (데이터베이스, 테이블, 뷰, 사용자 등) 를 생성
        ```sql
        -- 테이블 생성에 한정
        CREATE TABLE 테이블명 
         ( {속성 이름 데이터 타입
             [NOT NULL]
             [UNIQUE]
             [DEFAULT 기본값]
             [CHECK 체크조건]
            }

            [PRIMARY KEY 속성이름(들)]
            {[FOREIGN KEY 속성이름 REFERENCES 테이블 이름(속성이름)]
                [ON UPDATE [NO ACTION | CASCADE | SET NULL | SET DEFAULT]]
            }
         )        
        ```
    - ALTER : 개체를 변경(수정)하는 구문
        ```sql
        ALTER TABLE 테이블 명
            [ADD속성이름 데이터 타입]
            [DROP COLUMN 속성이름]
            [ALTER COLUMN 속성이름 데이터 타입]
            [ALTER COLUMN 속성이름 [NULL | NOT NULL]]
            [ADD PRIMARY KEY(속성이름)]
            [[ADD:DROP]제약조건 이름];
        ```
    - DROP  : 개체를 삭제하는 구문
        ```sql
        DROP TABLE 테이블 명;
        ```

        - 외래키로 사용되는 기본키가 있으면, 외래키를 사용하는 테이블 삭제 후, 기본키의 테이블을 삭제해야함!!


## 4일차
- 관계 데이터 모델
    - 관계대수 - 릴레이션에서 원하는 결과를 얻기위한 수학의 대수와 같은 연산 사용 기술하는 언어
    - 셀렉션, 프로젝션, 집합, 조인, 카티션 프로덕트, etc...

- DML 학습(SELECT외)
    - INSERT

        ```sql
        INSERT INTO 테이블이름[(속성리스트)] 
             VALUES (값리스트);
        ```
    - UPDATE

        ```sql
        -- 트랜잭션을 걸어서 복구를 대비
        UPDATE 테이블이름
           SET 속성이름1=값[, 속성이름2=값, ...]
         WHERE <검색조건> -- 실무에서는 빼면 큰일남
        ```
    - DELETE

        ```sql
        -- 트래잭션을 걸어서 복구를 대비
        DELETE FROM 테이블이름
         WHERE <검색조건> -- 실무에서는 빼면 큰일남
        ```

- SQL 고급
    - 내장함수
        - 수학함수, 문자열함수, 날짜/시간함수, 변환함수, 커서함수(!), 보안함수, 시스템함수 등
        - NULL(!)
    - 서브쿼리 리뷰
        - SELECT - 단일행, 단일열(스칼라 서브쿼리)
        - FROM - 다수행, 다수열
        - WHERE - 다수행, 단일열(보통)
            - 비교연산, 집합연산, 한정연산, 존재연산 가능

## 5일차
- SQL 고급
    - 서브쿼리 리뷰
    - 뷰 
        - 복잡한 쿼리로 생성되는 결과를 자주 사용하기 위해서 만드는 개체
        - 편리하고, 보안에 강하며 논리적 독십성을 띰
        - 원본 데이터가 변경되면 같이 변경되고, 인덱스 생성은 어렵다.
        - CUD 연산에 제약이 있음

        ```sql
        --생성
        CREATE VIEW 뷰 이름[(열이름 [, ...])]
        AS<SELECT 쿼리문>;
        -- 수정
        ALTER VIEW 뷰이름 [(열이름 [, ...])]

        -- 삭제
        DROP VIEW 뷰이름
        ```
        
    - 인덱스
        
        ```sql
        -- 생성
        CREATE [UNIQUE][CLUSTERED|NONCLUSTERED] INDEX 인덱스 이름
        ON 테이블명(속성이름 [ASC | DESC] [,,,n];)

        -- 수정
        ALTER INDEX {인덱스 이름 | ALL}
        ON 테이블명{REBUILD | DISABLE | REORGANIZE};

        -- 삭제
        DROP INDEX 인덱스 이름 ON 테이블 명;
        ```

        - SSMS 에서 실행 계획을 가지고 쿼리 실행 성능을 체크 할 수 있음.

- 파이썬 SQL Server 연동 프로그래밍
    - Madang 데이터 베이스 연동 (Madang DB 관리 프로그램)
    - PyQT GUI 생성
    - SQL Server 데이터 핸들링
        - pymysql 라이브러리 설치
        ```shell
        > pip install pymssql
        ```
    - DB연결 설정 : Oracle, MySQL 등은 설정 없음
        - 구성 관리자에서 TCP/IP 로 접근을 허용하지 않으면 접속이 안됨
            1. 시작 메뉴 > 모든 앱 > Microsoft SQL Server 20xx > **SQL server 20xx 구성관리자 실행**
            2. SQL Server 네트워크 구성 > **MSSQL SERVER에 대한 프로토콜** 클릭
            3. TCP/IP 프로토콜 상태 사용안함(최초) > **TCP/IP 프로토콜 사용 > '예' 로 변경하기!!**
            4. **IP 주소 탭에서 IP2(본인 IP), IP4(127.0.0.1)에 사용 '예' 로 바꾸기** 
            5. 적용 후 SQL Server 서비스 > SQL Server(MSSQLSERVER) 더블 클릭후 , **다시 시작하기** 버튼 클릭 !!

        ![구성관리자](https://github.com/JEONGWOO0705/basic_database_2024/blob/main/images/db005.png?raw=true)

- 데이터베이스 모델링
