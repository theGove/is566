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
           ,sum(i.saleprice*i.quantity) over(partition by s.saleid) as sale_total

    from   redcat.sale s
      join redcat.saleitem i
        on i.saleid=s.saleid
)

select   rownum  
        ,saleid
        ,saledate
        ,customerid
        ,productid
        ,quantity
        ,saleprice
        ,line_total
        ,sale_total
from sales
where rownum <21;  