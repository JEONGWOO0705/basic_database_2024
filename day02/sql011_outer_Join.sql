-- OUTER JOIN()
SELECT *
  FROM Table A A
  LEFT OUTER JOIN Table B B
    ON A.key = B.key;

SELECT *
  FROM Table B B
  LEFT OUTER JOIN Table A A
    ON A.key = B.key;

// 예시라 실행은 안됨