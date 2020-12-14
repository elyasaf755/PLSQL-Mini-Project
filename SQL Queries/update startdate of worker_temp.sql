begin
UPDATE worker_temp set startdate = TO_DATE(
              TRUNC(
                   DBMS_RANDOM.VALUE(TO_CHAR(DATE '1980-01-01','J')
                                    ,TO_CHAR(DATE '2019-12-31','J')
                                    )
                    ),'J'
               )
               WHERE startdate IS NULL;
commit;
end;
