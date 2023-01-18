-- 예제 33. NULL값 대신 다른 데이터 출력하기(NVL, NVL2)

/* 이름과 월급과 커미션을 출력하는데 커미션이 null인 사원들은 값을 0으로 출력 */
select ename, comm, nvl(comm, 0)
    from emp;
    -- nvl(컬럼명, 변경 값)
    -- nvl(Null Value) 함수 : null값을 다른 값으로 치환하는 함수

    select ename, sal, comm, sal+nvl(comm,0)
        from emp;
        -- 데이터에 null 값이 존재하는 경우, 연산자를 이용한 결과 출력 시 null 값으로 출력된다.

/* 이름과 커미션을 출력하는데 커미션이 null인 사원들은 no comm 이라는 글씨로 출력 */
select ename, nvl(comm, 'no comm')
    from emp;
    -- 오류 난다.
    -- WHY? comm은 숫자인데 문자로 지정했기 때문
    -- 기존의 데이터와 치환할 데이터 형이 다른 경우 : 기존의 데이터형이 변경될 데이터 형태를 인식하지 못하여 에러를 발생시킴

    select ename, nvl(to_char(comm), 'no comm')
        from emp;
        -- CORRECT !