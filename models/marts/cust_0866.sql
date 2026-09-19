select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s4 as t1,
    p1.s3 - p2.t3 as t2,
    p1.s4 as t3,
    p2.t3 as t4
from {{ ref('cust_0610') }} as p0
left join {{ ref('cust_0135') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0667') }} as p2 on p2.customer_id = p0.customer_id
