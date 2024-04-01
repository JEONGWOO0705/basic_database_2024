-- DDL : 데이터 정의 언어
-- 객체 생성, 수정, 삭제

--1. NEW Book 이라는 테이블 생성하라
/* 
 bookid(도서번호 : 기본키) - int
 bookname - varchar(20)
 publisher- varchar
 price - int
*/
DROP TABLE NewBook;



-- 기본키를 통합
CREATE TABLE NewBook(
    bookid INT PRIMARY KEY,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT

);

-- 기본키가 두개 이상이면
CREATE TABLE NewBook(
    bookid INT ,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY(bookid, bookname)
);

-- 각 컬럼에 제약조건을 걸면
CREATE TABLE NewBook(
    bookname VARCHAR(20) NOT NULL,
    publisher VARCHAR(20) UNIQUE, -- 유니크 제약조건
    price INT DEFAULT 10000 CHECK(price>1000), -- 기본값 제약조건, 체크 제약조건
    PRIMARY KEY(bookname, publisher) -- 개체 무결성 제약조건
);

-- 새 고객 테이블(기본키)
CREATE TABLE NewCustomer(
    custid INT PRIMARY KEY,
    custname VARCHAR(40),
    custaddress VARCHAR(255),
    phone varchar(30)
);

--  새 주문테이블(기본키+외래키)
CREATE TABLE NewOrder(
    orderid INT,
    custid INT NOT NULL,
    bookid INT NOT NULL,
    saleprice INT,
    orderdate DATE,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE


);

-- 2. 테이블 변경 / 수정 ALTER
CREATE TABLE MyBook(
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT

);

-- MyBook에 isbn 이라는 컬럼을 추가
ALTER TABLE MyBook ADD isbn VARCHAR(13);

-- isbn을 int형으로 변경
ALTER TABLE MyBook ALTER COLUMN isbn INT;

-- isbn 을 컬럼 삭제
ALTER TABLE MyBook DROP COLUMN isbn;

-- bookname을 NOT NULL로 제약조건
ALTER TABLE MyBook ALTER COLUMN bookname INT NOT NULL;

-- bookid 에 기본키 설정
ALTER TABLE MyBook ALTER COLUMN bookid INT NOT NULL
ALTER TABLE MyBook ADD PRIMARY KEY(bookid);

--3 테이블 삭제
DROP TABLE MyBook;

-- 자식 테이블을 삭제하기 전에는 절대 안지워짐
DROP TABLE NewOrder;
DROP TABLE NewCustomer;

DROP TABLE NewBook;