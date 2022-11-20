-- 예제 7. WHERE절 배우기1(특정 값의 행만 출력 - 숫자 데이터 검색)

/* 월급이 3000인 사원들의 사원이름, 월급, 직업 출력 */
select ename, sal, job
    from emp
    where sal = 3000 ;

/* 사원번호가 7788인 사원의 사원번호, 사원이름, 월급 출력 */
select empno, ename, sal
    from emp
    where empno = 7788 ;



-- 예제 8. WHERE절 배우기2(문자와 날짜 검색)

/* 이름이 SCOTT인 사원의 이름, 월급, 직업, 입사일, 부서번호 출력 */
select empno, sal, job, hiredate, deptno
    from emp
    where ename = 'SCOTT';

/* 직입이 SALESMAN인 사원들의 이름, 직업, 입사일 출력 */
select ename, job, hiredate
    from emp
    where job = 'SALESMAN';

/* 81/11/17에 입사한 사원의 이름, 입사일 출력 */
select ename, hiredate
    from emp
    where hiredate = '81/11/17';



-- 예제 9. 산술 연산자 베우기(*, /, +, -)

/* 연봉이 36000 이상인 사원들의 이름과 연봉을 출력. 연봉은 월급의 12배로 출력 */
select ename, sal*12 as 연봉은
    from emp 
    where sal*12>=36000;
    -- 코딩 순서 : select > from > where
    -- 실제 실행 순서 : from > where > select
    -- 따라서 'where 연봉' 출력 안 됨.
    -- order by 절 제외 다른 절에서는 alias 사용 불가능

/* 직업이 ANALYST인 사원들의 이름과 연봉 출력 */
select ename, sal*12 as 연봉
    from emp
    where job = 'ANALYST';



-- 예제 10. 비교 연산자 배우기1(>,<, >=, <=, =, !=, <>, ^=)

/* 월급이 1200 이하인 사원들의 이름, 월급, 직업, 부서번호를 출력 */
select ename, sal, job, deptno
    from emp
    where sal <= 1200;

/* 직업이 SALESMAN이 아닌 사원들의 이름과 직업 출력 */
select ename, job
    from emp
    where job != 'SALESMAN';

select ename, job
    from emp
    where job ^= 'SALESMAN';
    -- != 와 ^= 는 같다
    --기타 비교 연산자 : between .. and / not between .. and / like / not like / in / not in / is null / is not null



-- 예제 11. 비교 연산자 배우기2(BETWEEN AND)

/* 월급이 1000 에서 3000 사이인 사원들의 이름과 월급을 출력 */
select ename, sal
    from emp
    where sal between 1000 and 3000;

select ename, sal
    from emp
    where sal >= 1000 and sal <= 3000;
    -- between은 등호가 있는 수식과 같다

/* 월급이 1000 에서 3000 사이가 아닌 사원들의 이름과 월급을 출력 */
select ename, sal
    from emp
    where sal not between 1000 and 3000;

select ename, sal
    from emp
    where sal<1000 or sal >3000;

/* 1981년 11월 01일부터 1982년 05월 30일 사이에 입사한 사원들의 이름과 입사일 출력 */
select ename, hiredate
    from emp
    where hiredate between '81/11/01' and '82/05/30';



-- 예제 12. 비교 연산자 배우기3(LIKE)

/* 이름의 첫글자가 S로 시작하는 사원들의 이름 출력(앞철자가 S이기만 하면 된다) */
select ename
    from emp
    where ename like 'S%';
    -- % : 이 자리에 뭐가 와도 상관없고, 개수가 몇 개가 되든 관계 없다
    -- _ : 이 자리에 뭐가 와도 상관없는데, 자릿수는 하나여야 한다

/* 이름의 끝글자가 T로 끝나는 사월들의 이름 출력 */
select ename
    from emp
    where ename like '%T';

/* 이름의 두 번째 철자가 M인 사원들의 이름 출력 */
select ename
    from emp
    where ename like '_M%';



-- 예제 13. 비교 연산자 배우기4(IS NULL)

/* 커미션이 null인 사원들의 이름, 커미션 출력 */
select ename, comm
    from emp
    where comm = null;
    -- 실행 안 됨.
    -- null 값 : 데이터가 없는 상태거나 알 수 없는 값을 나타냄
    -- 즉, null값과 비교연산자는 같이 사용할 수 없다

select ename, comm
    from emp
    where comm is null;
    -- 바르게 실행 됨

/* 커미션이 null이 아닌 사원들의 이름과 커미션 출력 */
select ename, comm
    from emp
    where comm is not null;
    -- 데이터에서 0과 공백(nulll)은 다른 값임



-- 예제 14. 비교 연산자 배우기5(IN)

/* 직업이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직업 출력 */
select ename, sal, job
    from emp
    where job in ('SALESMAN', 'ANALYST', 'MANAGER');
    -- 여러 개 출력시 = 아닌 in으로 작성
    -- 직업 하나 출력인 경우 where job = 'MANAGER'과 같이 작성

/* 직업이 SALESMAN, ANALYST, MANAGER가 아닌 사원들의 이름, 월급, 직업 출력 */
select ename, sal, job
    from emp
    where job not in ('SALESMAN', 'ANALYST', 'MANAGER');



-- 예제 15. 논리 연산자 배우기(AND, OR, NOT)

/* 직업이 SALESMAN 이고 월급이 1200 이상인 사원들의 이름, 월급, 직업 출력 */
select ename, sal, job
    from emp
    where job = 'SALESMAN' and sal >= 1200;

/* 부서번호가 30이고 커미션이 100 이상인 사원들의 이름, 월급, 커미션 출력 */
select ename, sal, comm
    from emp
    where deptno = 30 and comm >= 100;