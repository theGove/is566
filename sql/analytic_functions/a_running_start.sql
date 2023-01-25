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
select rownum, salesummary.* 
from   salesummary
where  rownum < 21