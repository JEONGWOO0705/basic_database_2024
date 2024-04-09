-- 1 
SELECT Email AS 'email'
     , Mobile AS 'mobile'
     , [Names] AS 'names'
     , Addr AS 'addr'
  FROM membertbl
ORDER BY addr DESC, email ASC
-- 2
SELECT [Names] AS '도서명'
     , Author AS '저자'
     , ISBN
     , Price AS '정가'
  FROM bookstbl
ORDER BY [Price] DESC


-- 3
SELECT m.[Names] AS '회원명'
     , m.Levels AS '회원등급'
     , m.Addr AS '회원 주소'
     , r.rentalDate AS '대여일' 
  FROM membertbl AS m
LEFT JOIN rentaltbl AS r ON m.memberIdx = r.memberIdx
WHERE r.memberIdx IS NULL 
  AND m.Levels = 'A'




-- 4
SELECT d.[Names] AS '책 장르'
     , FORMAT(SUM(b.Price), '#,#') + '원' AS '총 합계 금액'
  FROM divtbl AS d , bookstbl AS b
 WHERE d.Division = b.Division
 GROUP BY d.Division, d.[Names]


-- 5
SELECT d.[Names] AS '책 장르'
     , COUNT(d.Division) AS '권수'
     , FORMAT(SUM(b.Price), '#,#') + '원' AS '총 합계 금액'
  FROM divtbl AS d , bookstbl AS b
 WHERE d.Division = b.Division
 GROUP BY d.Division, d.[Names]
UNION ALL
SELECT '--합계--'
     , COUNT(d.Division)
     , FORMAT(SUM(b.Price), '#,#') + '원'
  FROM divtbl AS d , bookstbl AS b
 WHERE d.Division = b.Division;