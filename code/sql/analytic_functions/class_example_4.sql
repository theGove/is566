@config
alter session set current_schema=inspection;

with table1 as (
select * from inspection_summary
order by dba_name,
inspection_date
)

select * from table1
where rownum < 51;






exit