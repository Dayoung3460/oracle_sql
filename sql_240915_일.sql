--다음 세 문장의 유효성을 판별하여 True 또는 False로 답하시오.
--1. 그룹 함수는 여러 행에 적용되어 그룹 당 하나의 결과를 출력한다. T
--2. 그룹 함수는 계산에 널을 포함한다. F
--3. WHERE 절은 그룹 계산에 행(row)을 포함시키기 전에 행을 제한한다. T

--4. 모든 사원의 급여 최고액, 최저액, 총액 및 평균액을 표시하시오. 
--열 레이블을 각각 Maximum, Minimum, Sum 및 Average로 지정하고 결과를 정수로 반올림하도록 작성하시오.
SELECT ROUND(MAX(salary)) "Maximum", 
       ROUND(MIN(salary)) "Minimum",
       ROUND(SUM(salary)) "Sum", 
       ROUND(AVG(salary)) "Average"
FROM   employees;

--5. 위의 질의를 수정하여 각 업무 유형(job_id)별로 급여 최고액, 최저액, 총액 및 평균액을 표시하시오. 
SELECT   job_id, 
         ROUND(MAX(salary)) "Maximum", 
         ROUND(MIN(salary)) "Minimum",
         ROUND(SUM(salary)) "Sum", 
         ROUND(AVG(salary)) "Average"
FROM     employees
GROUP BY job_id;

--6. 업무별(job_id) 사원 수를 표시하는 질의를 작성하시오.
SELECT   job_id, COUNT(*)
FROM     employees
GROUP BY job_id;

--7. 관리자 수를 확인하시오. 열 레이블은 Number of Managers로 지정하시오. (힌트: MANAGER_ID 열을 사용)
SELECT COUNT(DISTINCT manager_id) "Number of Managers"
FROM   employees;

--8. 최고 급여와 최저 급여의 차액을 표시하는 질의를 작성하고 열 레이블을 DIFFERENCE로 지정하시오.
SELECT MAX(salary)-MIN(salary) DIFFERENCE
FROM   employees;

--9. 관리자 번호 및 해당 관리자에 속한 사원의 최저 급여를 표시하시오. 
--   관리자를 알 수 없는 사원 및 최저 급여가 6,000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하시오.
SELECT   manager_id, MIN(salary) 
FROM     employees
WHERE    manager_id IS NOT NULL
GROUP BY manager_id
HAVING   MIN(salary) >= 6000
ORDER BY MIN(salary) DESC;