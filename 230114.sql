-- 예제 32. 암시적 형 변환 이해하기

/* 아래의 쿼리문은 실행이 될까요? */
select ename, sal
    from emp
    where sal = '3000';
    -- 출력 O .
    -- WHY? sal은 숫자이고 '3000'은 문자라 오류가 나야하는데 암시적 형 변환으로 알아서 값 출력되게 변환됨.
    -- 즉, WHERE sal = 3000으로 알아서 출력된 것
    -- 암시적 형 변환 : Oracle DB에서 조건절의 데이터를 확인 후 자동으로 형 변환을 시행한다
    -- Query 실행 계획 {explain plan for ~ from table(dbms_xplan.display)}: 질의문이 실행되는 순서와 정보 출력으로 암시적 형 변환 확인 가능
    explain plan for
    select ename, sal
        from emp
        where sal='3000';
    select * from table(dbms_xplan.display);

/* 아래의 쿼리문은 실행이 될까요? */
select ename, sal
    from emp
    where sal like '30%';
    -- 출력 O
    -- WHY? 숫자가 우선순위가 높아서 문자를 숫자로 바꾸는데 문자에 % 붙어있기 때문에 숫자를 문자로 바꾸게 됨