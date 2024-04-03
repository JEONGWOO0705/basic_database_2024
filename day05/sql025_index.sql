-- 인덱스(책의 목차와 기능이 동일)
-- Book 의 bookname 열에 NON 클러스터링 인덱스 IX_book_bookname을 생성하시오

CREATE INDEX IX_Book_bookname ON Book(bookname);

-- Customer 의 name 열에 클러스터드 인덱스 CIX_Customer_name
-- 보통 이런식으로 안검
-- 기본키에 클러스터드, 나머지 컬럼 넌클러스터드
CREATE CLUSTERED INDEX CIX_Customer_name ON Customer(name)

-- Book 에 publisher, price 동시에 인덱스 IX_Book_pubprice 인덱스 생성
CREATE INDEX IX_Book_pubprice ON Book(publisher,price);

-- 인덱스 재구성
-- PK 인 기본키는 값이 추가되면 자동으로 인덱스를 재구성한다.
-- NON 클러스터드 인덱스는 재구성이 필요할 수 가 있음(DBA 정기적으로 작업 필요)
-- IX_Book_pubprice를 재구성하라
ALTER INDEX IX_Book_pubprice ON Book REBUILD;
ALTER INDEX IX_Book_pubprice ON Book REORGANIZE; -- 인덱스 재정리

-- 인덱스 삭제
DROP INDEX IX_BOOK ON Book
DROP INDEX CIX_Customer_name ON Customer;