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
    from   redcat.sale s
      join redcat.saleitem i
        on i.saleid=s.saleid
    where extract(month from saledate) = 2  
),
cust as (select * from redcat.customer where state='UT')

select rownum,  sales.* from sales
where rownum <11;