-- 예제 21. 특정 철자를 N개 만큼 채우기(LPAD, RPAD)

/* 이름과 월급을 출력하는데 월급 컬럼의 자릿수를 10자리로 하고, 월급을 출력 후 남은 자리에 별표(*) 채워 출력 */
select ename, lpad(sal, 10, '*')
    from emp;
    -- lpad(컬럼명, 출력할 전체 자릿수, 왼쪽 남은 공간에 채워넣을 문자)

/* 이름과 월급을 출력하는데 월급 컬럼의 자릿수를 10자리로 하고, 월급을 출력 후 남은 자리 오른쪽에 별표(*)를 채워서 출력 */
select ename, rpad(sal, 10, '*')
    from emp;



-- 예제 22. 특정 철자 잘라내기(TRIM, RTRIM, LTRIM)

/* 다음과 같이 smith 영어 단어에서 앞에 s를 잘라내서 출력하고 뒤에 h를 잘라서 출력하고 양쪽 s를 잘라서 출력 */
select 'smith', ltrim('smith', 's'), rtrim('smith', 'h'), trim('s' from 'smiths')
    from dual;
    -- ltrim 또는 rtrim(컬럼명 또는 "문자열", "잘라낼 문자열")

/* 다음의 데이터를 사원 테이블에 입력하고 이름이 JACK인 사원의 이름과 월급을 출력하세요 */
insert into emp(empno, ename, sal)
    values(3821, 'JACK', 3000);
commit ;
    -- insert into 테이블명(컬럼명1, 컬럼명2, ...) values (데이터1, 데이터2, ...) : DML 문장으로 테이블에 테이터 추가 시 사용
    -- commit : 테이블에 변동이 생겼을 경우 해당 작업 확정짓는 명령어

insert into emp(empno, ename, sal)
    values(3821, 'JACK     ', 3000);
    commit;

select ename, sal
    from emp
    where trim(ename) = 'JACK';
    -- 출력해야하는데 공백이 몇 개인지 모르는 경우
    -- trim / ltrim / rtrim 함수에서 잘라낼 문자열을 입력하지 않으면 기본값으로 공백을 잘라낸다



-- 예제 23. 반올림해서 출력하기(ROUND) 

/* 876.567 숫자를 출력하는데 소수점 두 번째 자리인 6에서 반올림해서 출력 */
select round(876.567, 1)
    from dual;
    -- round(데이터, 자릿수)
    -- 8(-3) 7(-2) 6(-1) .(0) 5(1) 6(2) 7(3)
    -- 정수만 출력 시 0을 쓰면 877됨. -2를 쓰면 10의 자리에서 반올림해서 900 출력

/* 사원 테이블에서 이름과 월급의 12%를 출력하는데 소수점 이하는 출력되지 않도록 반올림 */
select ename, round(sal * 0.12)
    from emp;



-- 예제 24. 숫자를 버리고 출력하기(TRUNC)

/* 876.567 숫자를 출력하는데 소수점 두 번째 자리인 6과 그 이후의 숫자들을 모두 버리고 출력 */
select trunc(876.567, 1)
    from dual;
    -- trunc(데이터, 자릿수)
    -- trunc 함수에서 자릿수는 잘라낸 뒤 남겨놓을 자리 값 입력

select trunc(876.567, 0)
    from dual;
    -- 876 출력

/*사원 테이블에서 이름과 월급의 12%를 출력하는데 소수점 이하는 출력되지 않도록 버림 */
select ename, trunc(sal * 0.12)
    from emp;



-- 예제 25. 나눈 나머지 값 출력하기(MOD)

/* 숫자 10을 3으로 나눈 나머지 값 출력 */
select mod(10, 3)
    from dual;
    -- mod(데이터, 나눌 수)

/* 사원 번호가 홀수인 사원들의 사원번호와 이름을 출력 */
select empno, ename
    from emp
    where mod(empno, 2) = 1;