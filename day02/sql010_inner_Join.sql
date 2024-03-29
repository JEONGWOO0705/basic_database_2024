-- 두개 이상의 테이블 SQL 쿼리 작성
-- Customer, Order 테이블을 동시에 조회

SELECT * 
  FROM Customer, Orders;

-- Customer, Order 테이블을 동시에 조회(둘의 custid가 일치하는 조건에서)
-- RDB에서 가장 가장 중요한 쿼리문 1번
SELECT * 
  FROM Customer, Orders
 WHERE Customer.custid = Orders.custid
 ORDER BY Customer.custid ASC;

-- 주문한 책의 고객이름과 책 판매액 조회
SELECT Customer.[name]
	 , Orders.saleprice
  FROM Customer, Orders
 WHERE Customer.custid = Orders.custid

 -- 고객별로 주문한 모든 도서의 총 판매액을 구한다
SELECT Customer.[name]
	 , SUM(Orders.saleprice) AS [판매액]
  FROM Customer, Orders
 WHERE Customer.custid = Orders.custid
 GROUP BY Customer.[name]
 ORDER BY Customer.[name];

 -- 각테이블의 별명으로 줄여서 쓰는게 일반적
 -- JOIN, 내부조인, Inner Join

 SELECT c.[name]
	 , SUM(o.saleprice) AS [판매액]
  FROM Customer AS c, Orders AS o
 WHERE c.custid = o.custid
 GROUP BY c.[name]
 ORDER BY c.[name];

 -- 세개 테이블 조인
SELECT *
  FROM Customer AS c, Orders AS o, Book AS b
 WHERE c.custid = o.custid
   AND o.bookid = b.bookid;

-- 실제 표준 SQL Inner Join - 더 복잡함
SELECT *
  FROM Customer AS c
 INNER JOIN Orders AS o
    ON c.custid = o.custid
 INNER JOIN Book AS b
	ON o.bookid = b.bookid

-- 가격이 20,000원 이상이 도서를 주문한 고객의 이름과 도서명 조회
SELECT c.[name],b.bookname
  FROM Orders AS o, Book AS b, Customer AS c
 WHERE o.custid = c.custid
   AND b.bookid = o.bookid -- 여기까지는 Join을 위한 조건
   AND b.price >= 20000; -- 그외 필터링을 위한 조건
