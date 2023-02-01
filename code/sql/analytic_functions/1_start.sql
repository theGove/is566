@config

select * from (
    select  rownum 
           ,s.saleid
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
)

    where rownum <21    
;

exit