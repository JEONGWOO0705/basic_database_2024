-- 서브쿼리 리뷰
-- WHERE 절 서브쿼리
-- All, ANY, SOME
-- 3번 고객이(장미란) 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 다른 주문의 주문번호, 금액 표시

SELECT *
  FROM Customer

-- 장미란이 주문한 내역
SELECT MAX(saleprice) AS '최고 금액'
  FROM Orders
 WHERE custid = 3;

-- 13,000원 보다 비싼 도서를 구입한 사람의 주문 번호 및 금액을 표시하라
SELECT o.orderid
     , o.saleprice
  FROM Orders o
 WHERE o.saleprice > 13000;

 -- 서브 쿼리 사용하기!!
 SELECT o.orderid
      , o.saleprice
  FROM Orders o
 WHERE o.saleprice > (SELECT MAX(saleprice) AS '최고 금액'
                        FROM Orders
                       WHERE custid = 3)


-- EXISTS, NOT EXISTS - 열을 명시 안함
-- 대한민국 거주 고객에게 판매한 도서의 총 판매액
-- 전체 판매액 118,000, 대한민국 고객 판매액 46,000

SELECT SUM(saleprice) '대한민국 고객 판매액' -- 서브쿼리로 하기
  FROM Orders o
 WHERE EXISTS(SELECT *
                FROM Customer c
               WHERE c.address LIKE '%대한민국%'
                 AND c.custid = o.custid)


SELECT SUM(saleprice) '대한민국 고객 판매액' -- 조인으로 하기 
  FROM Orders AS o, Customer AS c
 WHERE o.custid = c.custid
   AND c.address LIKE '%대한민국%'

-- SELECT 절 서브쿼리, JOIN으로 변경 가능, 이미 쿼리가 너무 복잡해서 더이상 테이블을 추가하기 힘들면 많이 사용
-- 고객별 판매액을 보이시오

SELECT SUM(o.saleprice) '고객별 판매액'
     , o.custid
     , (SELECT name FROM Customer WHERE Customer.custid = o.custid) 'name'
  FROM Orders AS o
 GROUP BY o.custid -- GROUP BY가 들어가면 SELECT 절에 집계함수가 반드시 들어가야함
                   -- GROUP BY 에 custid 가 들어가면 SELECT절에 custid 밖에 못들어감

-- 조인으로 가능, 바로 다음장에 나옴 

-- UPDATE 에서도 사용 가능
-- 사전 준비
ALTER TABLE Orders ADD bookname VARCHAR(40);

-- UPDATE, 한꺼번에 필요한 필드값을 한테이블에서 다른 테이블로 복사할 때 아주 유용함
UPDATE Orders
   SET bookname = (SELECT bookname
                     FROM Book
                    WHERE Book.bookid = Orders.bookid)

-- FROM 절 서브 쿼리(인라인 뷰[가상테이블])
-- 고객별 판매액으로 고객명과 판매 금액을 보이시오 (서브쿼리 --> 조인)
-- 고객별 판매액 집계 쿼리가 FROM 절에 들어가면 모든 속성(컬럼)에 이름이 지정되어야 함


SELECT b.Total
     , c.name
  FROM  (SELECT SUM(o.saleprice) AS 'Total'
              , o.custid
           FROM Orders AS o
          GROUP BY o.custid) AS b, Customer c
 WHERE b.custid = c.custid

-- 고객번호가 2 이하인 고객의 판매액을 보이시오
-- GROUP BY 에 들어갈 속성(컬럼)은 최소화 하기!@!


SELECT SUM(o.saleprice) AS '고객별 판매액'
     , (SELECT name FROM Customer WHERE custid = c.custid) '고객명'
  FROM (
        SELECT custid 
             , [name]
          FROM Customer
         WHERE custid <= 2) AS c, Orders AS o
 WHERE c.custid = o.custid
GROUP BY c.custid
