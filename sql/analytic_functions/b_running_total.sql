with salesummary as(
    select  s.saleid
           ,s.saledate
           ,s.customerid
           ,s.shipping
           ,s.tax
           ,sum(saleprice) as amount
           ,count(*) as items
           ,sum(quantity) as total_items
    from   redcat.sale s
      join redcat.saleitem i
        on i.saleid=s.saleid
    group
       by   s.saleid
           ,s.saledate
           ,s.customerid
           ,s.shipping
           ,s.tax
    order by saledate       
)
, running as(
  select salesummary.*
         ,sum(amount) over(order by saledate rows between unbounded preceding and current row) as running_total

  from salesummary

)
select rownum, running.* 
from   running
where  rownum < 21