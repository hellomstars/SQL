-- 예제 27. 개월 수 더한 날짜 출력하기(ADD_MONTHS)

/* 2019년 5월 1일부터 100달 뒤의 날짜는 어떻게 되는지 출력 */
select add_months('2019/05/01', 100)
    from dual;
    -- add_months(기준날짜, 구하고 싶은 기간)

/* 오늘부터 100달 뒤의 날짜가 어떻게 되는지 출력 */
select add_months(sysdate, 100)
    from dual;



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