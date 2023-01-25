with salesummary as(
    select s.saledate
           ,sum(saleprice) as amount
           ,sum(quantity) as total_items
    from   redcat.sale s
      join redcat.saleitem i
        on i.saleid=s.saleid
    group
       by  s.saledate
    order by saledate       
)
, running as(
  select salesummary.*
         ,round(avg(amount) over(order by saledate rows between 7 preceding and current row),2) as weekly_average
         ,round(avg(total_items) over(order by saledate rows between 7 preceding and current row),2) as weekly_total_tiems

  from salesummary

)
select rownum, running.* 
from   running
where  rownum < 21