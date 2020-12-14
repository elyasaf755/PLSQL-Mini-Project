begin
UPDATE worker_temp set enddate = TO_DATE(
              TRUNC(
                   DBMS_RANDOM.VALUE(TO_CHAR(DATE '2020-01-01','J')
                                    ,TO_CHAR(DATE '2040-12-31','J')
                                    )
                    ),'J'
               )
               WHERE enddate IS NULL;
commit;
end;
