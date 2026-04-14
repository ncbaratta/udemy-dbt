select
--from raw orders
o.orderid, o.orderdate, o.shipdate, o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordersellingprice, o.ordercostprice,
--from raw customers
c.customername, c.segment, c.country, c.customerid,
--from raw product
p.category, p.productname, p.subcategory, p.productid,
{{markup('ordersellingprice','ordercostprice')}} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c 
on (o.customerid=c.customerid)
left join {{ ref('raw_product') }} as p 
on (o.productid=p.productid)
{{limit_data_in_dev('orderdate')}}