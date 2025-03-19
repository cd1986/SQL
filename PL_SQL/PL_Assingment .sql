--- if , if else ,if elif else, for , while ,continue ,exit

-- declare 
--     variable1 number:=10;
-- begin 
-- if variable1>15 then
--         dbms_output.put_line('number is greate than 5');
--     end if ;
-- end ;


-- DECLARE
--     v_score NUMBER := 40;
-- BEGIN
--     IF v_score >= 50 THEN
--         DBMS_OUTPUT.PUT_LINE('Pass');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Fail');
--     END IF;
-- END;

-- DECLARE
--     v_marks NUMBER := 85;
-- BEGIN
--     IF v_marks >= 90 THEN
--         DBMS_OUTPUT.PUT_LINE('Grade: A');
--     ELSIF v_marks >= 75 THEN
--         DBMS_OUTPUT.PUT_LINE('Grade: B');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Grade: C');
--     END IF;
-- END;

-- in emp table i have an emplyee 101 ,rank his salary as high medium or low 

-- declare 
--     emp_name VARCHAR2(20);
--     emp_salary number;
--     grade_value varchar2(20);
-- BEGIN   
--     select first_name,salary into emp_name,emp_salary from hr.employees where employee_id=101;
--     IF emp_salary >= 30000 THEN
--         grade_value:='Grade: High';
--     ELSIF emp_salary >= 20000 THEN
--         grade_value:='Grade: Medium';
--     ELSE
--         grade_value:='Grade: Low';
--     END IF;
--     dbms_output.put_line(emp_name || emp_salary || grade_value);
-- end;

-- declare 
--     emp_name VARCHAR2(20):=20000;
--     emp_salary number;
  
-- BEGIN   
--     IF emp_salary >= 30000 THEN
--         grade_value:='Grade: High';
--         if emp_salary<70000 then 
--             grade_value:='very high'
--         else:
--             grade_value:='high salary'
--         end if;
--     ELSE
--         grade_value:='Grade: Low';
--     END IF;
--     dbms_output.put_line(emp_name || emp_salary || grade_value);
-- -- end;
-- DECLARE 
--     emp_name VARCHAR2(20) := 'John'; -- Employee name should be a string
--     emp_salary NUMBER := 20000; -- Assign a value to avoid NULL comparison errors
--     grade_value VARCHAR2(20); -- Declare grade_value
-- BEGIN   
--     -- Determine Grade based on Salary
--     IF emp_salary >= 30000 THEN
--         grade_value := 'Grade: High';
        
--         -- Nested IF to check salary range
--         IF emp_salary < 70000 THEN 
--             grade_value := ' High';
--         ELSE
--             grade_value := ' Very High Salary';
--         END IF;
--     ELSE
--         grade_value := 'Grade: Low';
--     END IF;

--     -- Print the Output
--     DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_name || ', Salary: ' || emp_salary || ', Grade: ' || grade_value);
-- END;

-- declare 
--     v_counter number :=1;
-- BEGIN   
--     loop
--         dbms_output.put_line(v_counter);
--         v_counter:=v_counter+1;
--         exit when v_counter>5;
--     end loop;
-- end;

-- declare 
--     v_counter number :=0;
-- BEGIN   
--     loop
--         dbms_output.put_line(v_counter);
--         v_counter:=v_counter+4;
--         exit when v_counter>100;
--     end loop;
-- end;



-- begin
--     for i in 1..5 loop
--         dbms_output.put_line('itteration' || i);
--     end loop;
-- end;

-- begin
--     for i in reverse 1..5 loop
--         dbms_output.put_line('itteration' || i);
--     end loop;
-- end;


-- begin
--     for i in reverse 1..10 loop
--         if mod(i,2)=1 then
--             dbms_output.put_line(i);
--         end if;
--     end loop;
-- end;

--1 to 10 squares of the numebers

-- begin
--     for i in reverse 1..10 loop
--         dbms_output.put_line(i ||' ' || i*i);
--     end loop;
-- end;

-- fibonacci 0 1 1 2 3 5 8 13 

-- a=0
-- b=1
-- c=a+b: 1
-- a=b 1
-- b=c 1
-- c : 2
-- a:1
-- b:2
-- 1+2 : 3

-- a:2
-- b:3
-- 2+3 : 5

-- declare 
--     a number:=0;
--     b number:=1;
--     c number;
-- BEGIN   
--     dbms_output.put_line(a);
--     dbms_output.put_line(b);
--     for i in 1..10 loop
--         c:=a+b;
--         dbms_output.put_line(c);
--         a:=b;
--         b:=c;
--     end loop;
-- end;

--- mutliplication tables of 1 to 10 upto 20 

DECLARE
    table1 number:=2;
begin
    for num in 1..5 loop
        dbms_output.put_line('multiplication table of num'||num);
        for i in 1..10 loop
            dbms_output.put_line(num || '*' || i || ':' ||i*num);
        end loop;
    end loop;
end;
