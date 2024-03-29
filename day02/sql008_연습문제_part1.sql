-- 연습문제
-- 1. 도서 번호가 1인 도서 검색
SELECT *
  FROM Book
 WHERE bookid = 1;

-- 2. 가격이 20,000 이상인 도서
SELECT *
  FROM Book
 WHERE price >= 20000;

-- 3. 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
SELECT SUM(saleprice)
  FROM Orders
 WHERE custid = 1;

 SELECT *
  FROM Orders

-- 4.박지성이 구매한 도서의 수
SELECT COUNT(*)
  FROM Orders
 WHERE custid = 1;