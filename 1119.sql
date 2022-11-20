-- 예제 1. 테이블에서 특정 열(column) 선택하기

/* 사원 테이블에서 사원 번호, 이름, 월급 출력 */
select empno, ename, sal
    from emp;

/* 사원 테이블에서 사원 이름, 직업, 부서 번호 출력 */
select ename, job, deptno
    from emp;



-- 예제 2. 테이블에서 모든 열(column) 출력하기

/* 사원 테이블의 모든 열과 데이터를 출력 */
select *
    from emp;

/* 부서 테이블의 모든 열과 데이터를 출력 */
select *
    from dept;



-- 예제 3. 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기

/* 사원 테이블의 사원번호, 이름, 월급을 각 컬럼명을 사원번호, 사원이름, Salary로 출력 */
select empno as 사원번호, ename as 사원이름, sal as "Salary"
    from emp;
    -- 대소문자나 언더바, 공백문자 등 표기하고 싶은 문자열 그대로 출력시 앞뒤로 “ ” 붙이기

/* 이름과 직업을 출력하는데 컬럼명을 이름, 직업으로 출력 */
select ename as "이름", job as "직업"
    from emp;



-- 예제 4. 연결 연산자 사용하기(||)

/* 사원 테이블에서 이름과 월급을 서로 붙여서 출력(ex. JONES2975) */
select ename || sal
    from emp;

/* 사원테이블에서 이름과 직업을 서로 붙여서 “KING의 직업은 PRESIDENT입니다” 문장으로 출력 */
select ename || '의 직업은' || job || ' 입니다'
    from emp;



-- 예제 5. 중복된 데이터를 제거해서 출력하기(DISTINCT)

/* 직업을 출력하는데 중복행을 제거해서 출력 */
select distinct job
    from emp;

/* 부서번호 출력시 중복행 제거 */
select distinct deptno
    from emp;



-- 예제 6. 데이터를 정렬해서 출력하기(ORDER BY)

/* 이름과 월급을 출력하는데 월급이 낮은 사원부터 높은 사원 순으로 출력 */
select ename, sal
    from emp
    order by sal asc;
    -- asc는 오름차순, desc는 내림차순

select ename, sal
    from emp
    order by 1 desc;
    -- order by 뒤에 1 : ename, 2 : sal 출력. 여기서는 이름별 내림차순

/* 이름과 입사일 출력시 최근 입사자부터 출력 */
select ename, hiredate
    from emp
    order by hiredate desc;