@config

with sales as(
    select  s.saleid
           ,s.saledate
           ,s.customerid
           ,s.shipping
           ,s.tax
           ,i.productid
           ,i.itemsize
           ,i.quantity
           ,i.saleprice
           ,i.saleprice*i.quantity as line_total
           ,count(*) over(partition by s.saleid) as line_count
           ,sum(i.quantity) over(partition by s.saleid) as item_count
           ,sum(i.saleprice*i.quantity) over(partition by s.saleid) as sale_total
           ,sum(i.saleprice*i.quantity) over(partition by s.saledate) as daily_total
           ,sum(i.saleprice*i.quantity) over() as grand_total

    from   redcat.sale s
      join redcat.saleitem i
        on i.saleid=s.saleid
    order 
        by sale_total desc     
)

select   rownum  
        ,saledate
        ,customerid
        ,productid
        ,quantity
        ,saleprice
        ,line_total
        ,daily_total
        ,sale_total
        ,grand_total
from sales
where rownum <21;    

exit