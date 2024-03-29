-- 연습문제 part2
-- solution 1
SELECT COUNT(*) AS '도서의 총 개수'
  FROM Book


-- solution 2
SELECT COUNT(DISTINCT publisher) AS '출판사의 총 개수'
  FROM Book

-- solution 3 : 모든 고객의 이름, 주소
SELECT name,address
  FROM Customer

-- solution 4 : 2024-07-04~ 2024-07-7 사이에 주문받은 도서의 주문번호
SELECT *
  FROM Orders


SELECT orderid
  FROM Orders
 WHERE orderdate >= '2023-07-04'
   AND orderdate <= '2023-07-07';

-- solution 5 : 2023-07-04 ~ 2023-07-07에 주문 받은 도서를 제외한 도서의 주문 번호
SELECT orderid
  FROM Orders
 WHERE orderdate < '2023-07-04'
   OR orderdate > '2023-07-07';

-- solution 6 : 성이 김 씨 인 고객의 이름과 주소
SELECT [name], [address]
  FROM Customer
 WHERE [name] LIKE '김%'

-- solution 7 : 성이 김 씨이고 이름이 '아' 로 끝나는 고객의 이름과 주소
SELECT [name],[address]
  FROM Customer
 WHERE [name] LIKE '김%'
   AND [name] LIKE '%아'

SELECT *
  FROM Customer