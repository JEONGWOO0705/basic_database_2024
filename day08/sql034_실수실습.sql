-- HR 데이터 베이스 연습

-- 샘플 문제 : 사원 정보 테이블 사번, 이름, 급여, 입사일, 상사의 사원 번호를 출력하시오. (107개 행)
SELECT EMPLOYEE_ID
     , FIRST_NAME + ' ' + LAST_NAME AS [name]
     , SALARY
     , HIRE_DATE
     , MANAGER_ID
  FROM employees

-- 1. 사원 정보에서 사원의 성과 이름을 name으로 , 업무는 job, 급여는 salary
--    연봉에 $100 보너스를 추가 계산한 연봉은 Increased Ann Salary,
--    월급에 $100 추가해서 Increased Salary 의 별칭으로 출력

SELECT FIRST_NAME + ' ' + LAST_NAME AS 'name'
     , JOB_ID AS 'job'
     , SALARY
     , (SALARY * 12) + 100 AS 'Increased Ann_Salary'
     , (SALARY + 100) * 12 AS 'Increased Salary' 
  FROM employees

/* 2. 사원 정보 모든 사원의 Last name : 1 Year Salary = $ 연봉
      컬럼에 1Year Salary 별칭을 붙이시오
*/

SELECT LAST_NAME + ': 1 Year Salary = $' + CONVERT(VARCHAr, SALARY * 12) AS '1 Year Salary'
  FROM employees

/* 3. 부서별 담당하는 업무를 한번씩 출력하시오 (20개행)
*/
SELECT DISTINCT DEPARTMENT_ID
     , JOB_ID
  FROM employees

-- WHERE, ORDER BY
-- 샘플 문제 : hr 부서에서 예산 문제로 급여 정보 보고서를 작성
/* 사원 정보에서 급여가 7,000~ 10,000 이외의 사람들의 성과 이름을, 급여를 급여가 작은 순서대로 출력 (75개 행)
*/
SELECT FIRST_NAME + ' ' + LAST_NAME AS 'name'
     , SALARY
  FROM employees
 WHERE SALARY NOT BETWEEN 7000 AND 10000
 ORDER BY SALARY ASC;

 /* 4. lastname에 e 와o 글자가 포함된 사원을 출력(10개행)
 */
SELECT LAST_NAME AS 'e and o Name'
  FROM employees
 WHERE LAST_NAME LIKE '%e%' AND LAST_NAME LIKE '%o%'

 /* 5. 현재의 날짜 타입을 날짜 함수를 통해서 확인
       2006년 5월 20일 부터 2007년 5월 20일 사이에 고용된 사원의 이름(first + last)
       사원 번호, 고용일자를 출력하시오 
       단, 입사일 빠른순으로 정렬(18개행 출력)
 */
 SELECT GETDATE()

SELECT FIRST_NAME + ' ' + LAST_NAME AS 'name'
     , EMPLOYEE_ID
     , HIRE_DATE
  FROM employees
 WHERE HIRE_DATE > '2006-05-20' AND HIRE_DATE < '2007-05-20'