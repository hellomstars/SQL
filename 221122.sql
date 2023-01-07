-- 예제 16. 대소문자 변환 함수 배우기(UPPER, LOWER, INITCAP)

/* 사원 테이블에서 이름을 출력하는데 모두 소문자로 출력 */
select lower(ename)
    from emp;
    -- 대문자는 upper
    -- 첫 번째 철자를 대문자, 나머지는 소문자로 변환 : initcap

select lower(ename), upper(ename), initcap(ename)
    from emp;

/* 이름이 scott인 사원의 이름과 월급을 출력하는데 이름을 소문자로 검색해도 결과가 출력되게 한다 */
select ename, sal
    from emp
    where lower(ename) = 'scott';



-- 예제 17. 문자에서 특정 철자 추출하기(SUBSTR)

/* SMITH라는 단어에서 MI만 추출해서 출력 */
select substr('SMITH', 2, 2)
    from dual;
    -- from dual : 가상의 테이블 환경을 구성하여 질의문의 결과를 확인할 때 사용
    -- dual : 함수로 실행되는 하나의 결과값을 보기 위한 가상의 테이블
    -- substr('SMITH', 시작철자 인덱스, 잘라낼 갯수)

/* 사원 테이블에서 이름을 출력하는데 이름의 첫글자만 출력하고 첫글자를 소문자로 출력 */
select lower(substr(ename, 1, 1)) 
    from emp;



-- 예제 18. 문자열의 길이를 출력하기(LENGTH)

/* 이름을 출력하고 이름의 철자의 길이를 출력 */
select ename, length(ename)
    from emp;

/* 이름의 철자의 길이가 5개 이상인 사원들의 이름과 이름의 철자의 길이를 출력 */
select ename, length(ename)
    from emp;
    where length(ename) >= 5;



-- 예제 19. 문자에서 특정 철자의 위치 출력하기(INSTR)

/*  SMITH라는 단어에서 알파벳 M이 몇 번째 자리에 있는지 출력 */
select instr('SMITH', 'M')
    from dual;

/* 이름에 철자 S가 포함된 사원들의 이름을 출력 */
select ename
    from emp
    where instr(ename, 'S') > 0 ;



-- 예제 20. 특정 절차를 다른 철자로 변경하기(REPLACE)

/* 이름과 월급을 출력하는데 숫자 0을 *로 출력 */
select ename, replace(sal, 0, '*')
    from emp;
    -- replace(컬럼명 또는 "문자열", "변경될 문자열", "변경할 문자열")

/* 이름과 월급을 출력하는데 숫자 0부터 3까지는 *로 출력 */
select ename, regexp_replace(sal, '[0=3]', '*')
    from emp;
    -- regexp_ : 정규식 표현으로 regexp_ 뒤에 사용할 함수명을 입력 후 원하는 값을 출력
    -- 정규식 함수 : SQL의 기본 함수보다 넓은 범위로 함수를 적용할 때 많이 사용