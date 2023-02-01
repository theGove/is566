@config
alter session set current_schema=inspection;
with data as(
select   inspection_id
        ,inspection_date
        ,employee
        ,DBA_name
        ,facility_type
        ,fine 
        ,sum(fine) over(partition by employee order by inspection_date, dba_name rows between unbounded preceding and current row) as employee_running_total
        ,sum(fine) over() as grand_total
        ,sum(fine) over(partition by facility_type) as facility_type_total
from inspection.inspection_summary
where extract(month from inspection_date) = '12'
  and extract(year from inspection_date) = '2012'
)
select * from data order by inspection_date, employee, dba_name

;







exit