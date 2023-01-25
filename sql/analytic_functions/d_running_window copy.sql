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
         ,round(avg(amount) over(order by saledate rows between 7 preceding and current row),2) as average_tsd

  from salesummary

)
select rownum, running.* 
from   running
where  rownum < 21