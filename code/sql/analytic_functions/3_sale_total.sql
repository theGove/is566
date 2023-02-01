@config
with saletotal as(
select  sum(saleprice*quantity) as saleamount
       ,saleid
from   redcat.saleitem
group
   by  saleid 
)

, saledetail as(
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
           ,t.saleamount
    from   redcat.sale s
      join redcat.saleitem i
        on i.saleid=s.saleid
      join saletotal t
        on t.saleid = s.saleid  
    where extract (year from saledate) = 2015
)
select * from saledetail
where rownum < 21
order by customerid
;

exit