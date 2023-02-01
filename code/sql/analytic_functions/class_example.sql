@config
with saletotal as (
  select saleid
        ,sum(saleprice*quantity) as sale_total
  FROM  redcat.saleItem     
  GROUP
     BY saleid 
),
  sales as(
    select rownum
           ,s.saleid
           ,s.saledate
           ,s.customerid
           --,s.shipping
           --,s.tax
           ,i.productid
           ,i.itemsize
           ,i.quantity
           ,i.saleprice
           ,i.saleprice*i.quantity as line_total
           ,sale_total
    from   redcat.sale s
      join redcat.saleitem i
        on i.saleid=s.saleid
      join saletotal st 
        on st.saleid = s.saleid
   
  )
  select * from sales  
   where rownum <21      
;

exit