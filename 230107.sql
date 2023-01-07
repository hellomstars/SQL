-- 예제 28. 특정 날짜 뒤에 오는 요일 날짜 출력하기(NEXT_DAY)

/* 2021년 5월 5일로부터 바로 돌아오는 월요일의 날짜가 어떻게 되는지 출력 */
select next_day('2021/05/05', '월요일')
    from dual;
    -- next_day(기준날짜, 구하고 싶은 요일)

/* 오늘부터 앞으로 돌아올 금요일의 날짜가 어떻게 되는지 출력 */
select next_day(sysdate, '금요일')
    from dual;



-- 예제 29. 특정 날짜가 있는 달의 마지막 날짜 출력하기(LAST_DAY)

/* 2021년 5월 5일 해당 달의 마지막 날의 날짜를 출력 */
select last_day('2021/05/05')
    from dual;
    -- last_day(기준날짜)

/* 오늘부터 이번 달 말일까지 총 며칠 남았는지 출력 */
select last_day(sysdate) - sysdate
    from dual;



-- 예제 30. 문자형으로 데이터 유형 변환하기(to_char)

/* 이름이 SCOTT인 사원의 입사한 요일과 월급을 출력하는데 월급을 출력할 때에 천단위를 ,로 표시해서 출력 */
select ename, to_char(hiredate,'day'), to_char(sal,'999,999')
    from emp
    where ename='SCOTT';
    -- 날짜형 > 문자형 / 숫자형 > 문자형 변환 문제
    -- to_char(컬럼명 또는 "변경 전 데이터","변경 후 나타내고 싶은 포맷 형태")
    -- 날짜 포맷 : 년도(RRRR, YYYY, RR, YY) / 달(MON, MM) / 일(DD) / 요일(DAY, DY)
    -- 999,999 는 자릿수를 나타낸다
    -- to_char(sal, 'L999,999')입력 시 원화 포함 천자리수로 표시. L 은 로컬 화폐(원화)

/* 수요일에 입사한 사원들의 이름과 입사일과 입사한 요일 출력 */
select ename, hiredate, to_char(hiredate,'day')
    from emp
    where to_char(hiredate,'day')='수요일';
    -- 요일 출력
        select to_char(to_date('2011/01/01','RRRR/MM/DD'),'day')
        from dual;



-- 예제 31. 날짜형으로 데이터 유형 변환하기(TO_DATE)

/* 81년 11월 17일에 입사한 사원의 이름과 입사일을 출력 */
select ename, hiredate
    from emp
    where hiredate='81/11/17';
    -- 현재 세션의 날짜 형식과 맞지 않으면 출력이 안 됨. 현재는 년도/월/일로 되어있음
    -- 현재 세션 날짜 형식 확인 방법
        select *
        from nls_session_parameters;
    -- 날짜 형식 변환 방법 : alter session set nls_date_format='원하는 형식'
        alter session set nls_date_format='DD/MM/RR';
    -- 날짜 형식 상관 없이 출력 가능하게 하는 방법 : where hiredate = to_date('날짜',"작성한 날짜의 형식")

/* 1981년도에 입사한 사원들의 이름과 입사일을 출력하는데 최근에 입사한 사원부터 출력 */
select ename, hiredate
    from emp
    where hiredate between to_date('1981/01/01','RRRR/MM/DD')
                    and to_date('1981/12/31','RRRR/MM/DD')+1
    order by hiredate desc;
    -- 꽉 채운 12월 31일 까지 출력해야돼서 +1