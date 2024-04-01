-- 1. 주문하지 않은 고객의 이름(서브쿼리 사용)
SELECT [name]
  FROM Customer AS c
 WHERE c.custid NOT IN (SELECT o.custid
                          FROM Orders o)

-- 1. solution
SELECT [name]
  FROM Customer
 WHERE custid NOT IN(SELECT DISTINCT custid
                 FROM Orders
                 )




-- 2. 주문 금액의 총액과 주문의 평균 금액
SELECT SUM(b.price) AS '총액', AVG(b.price) AS '평균 금액'
  FROM Book b

-- 2. Solution
SELECT SUM(saleprice) '주문 금액'
     , AVG(saleprice) '주문 평균 금액'
  FROM Orders



-- 3. 고객의 이름과 고객별 구매액
SELECT c.[name] AS [고객이름], SUM(o.saleprice) AS '고객별 구매액'
  FROM Customer AS c, Orders AS o 
 WHERE c.custid = o.custid
GROUP BY c.name

-- 3. Solution
SELECT (SELECT [name] FROM Customer c WHERE c.custid = o.custid) '구매 고객'
     , SUM(o.saleprice) '고객별 구매액'
  FROM Orders o
 GROUP BY custid


-- 4. 고객의 이름과 고객이 구매한 도서 목록
SELECT c.[name] AS [고객이름], b.bookname AS '도서 목록'
  FROM Customer AS c, Orders AS o, Book b
 WHERE c.custid = o.custid
   AND b.bookid = o.bookid
ORDER BY c.name

-- 4. Solution
SELECT c.name, b.bookname
  FROM Customer c, Orders o, Book b
 WHERE c.custid = o.custid
   AND o.bookid = b.bookid
 ORDER BY c.[name] ASC;

-- 5. 도서의 가격(Book Table)과 판매가격(Order테이블)의 차이가 가장 많은 주문
SELECT b.bookname, (b.price - o.saleprice) AS '정가와의 차'
  FROM Book b, Orders o


-- 5. Solution
SELECT TOP 1
       b.bookname
     , o.saleprice -- 1
     , b.price     -- 2
     , (b.price - o.saleprice) '원가 차이' -- 3
  FROM Orders o, Book b
 WHERE o.bookid = b.bookid
-- ORDER BY (b.price - o.saleprice) DESC;
 ORDER BY 4 DESC;
 
-- 6. 전체 도서 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름 
-- 6. Solution
-- 전체 도서의 판매 평균 금액 = 11,800원
SELECT (SELECT [name] FROM Customer WHERE custid = base.custid) AS '고객명'
     , base.*
  FROM(SELECT o.custid
            , AVG(o.saleprice) AS 'Average'
         FROM Orders o
        GROUP BY o.custid) AS base
 WHERE base.Average >= (SELECT AVG(saleprice) FROM Orders)

 
