select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s1 - p1.t6 as t1,
    p0.t4 - p2.s1 as t2,
    p2.s3 as t3,
    p0.t4 as t4
from {{ ref('cust_0065') }} as p0
left join {{ ref('cust_0123') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0174') }} as p2 on p2.customer_id = p0.customer_id
