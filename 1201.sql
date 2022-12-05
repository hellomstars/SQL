-- 예제 26. 날짜 간 개월 수 출력하기(MONTHS_BETWEEN)

/* 이름을 출력하고 입사한 날짜부터 오늘까지 총 몇 달을 근무했는지 출력 */
select ename, months_between(sysdate, hiredate)
    from emp;
    -- 오늘 날짜 출력 : select sysdate from dual;
    -- month_between() 함수에서 기준날짜1이 기준날짜2보다 큰 날짜(현재로부터 가까운)이어야 함

select ename, round(months_between(sysdate, hiredate))
    from emp;
    -- 소숫점 제거 후 반올림 된 정수만 출력

delete from emp
    where trim(ename)='JACK';
commit;
    -- delete from 테이블명 where 조건 : DML문으로 테이블에서 조건에 맞는 행 삭제
    -- commit 까지 해줘야 최종 수정

/* 내가 태어난 날부터 오늘까지 총 몇 달인지 출력 */
select month_between(sysdate, '2001/01/03')
    from dual;



-- 예제 27. 개월 수 더한 날짜 출력하기(ADD_MONTHS)

/* 2019년 5월 1일부터 100달 뒤의 날짜는 어떻게 되는지 출력 */
select add_months('2019/05/01', 100)
    from dual;
    -- add_months(기준 날짜, 구하고 싶은 기간)

/* 오늘부터 100달 뒤의 날짜가 어떻게 되는지 출력 */
select add_months(sysdate, 100)
    from dual;