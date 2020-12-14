begin
UPDATE worker_temp_a set birthdate = TO_DATE(
              TRUNC(
                   DBMS_RANDOM.VALUE(TO_CHAR(DATE '1950-01-01','J')
                                    ,TO_CHAR(DATE '1960-12-31','J')
                                    )
                    ),'J'
               )
               WHERE birthdate IS NULL;
commit;
end;
