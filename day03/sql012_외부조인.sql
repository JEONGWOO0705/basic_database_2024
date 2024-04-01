-- Customer를 기준으로 Orders테이블과 외부조인하기

SELECT c.custid
      ,c.[name]
      ,c.[address]
      ,c.phone
      ,o.bookid
      ,o.custid -- OUTER JOIN 에서는 이 외래키는 필요 X
      ,o.orderdate
      ,o.orderid
      ,o.saleprice
  FROM Customer AS c LEFT OUTER JOIN Orders AS o -- LEFT, RIGHT, FULL등으로 변경하면서 실행
    ON c.custid = o.custid