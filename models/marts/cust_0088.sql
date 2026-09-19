select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t5 as t1,
    p1.s1 as t2,
    p0.t2 as t3,
    p1.s3 * 0.5 + p0.t2 * 0.5 as t4,
    p0.t2 as t5,
    p0.t2 as t6
from {{ ref('cust_0047') }} as p0
left join {{ ref('cust_0082') }} as p1 on p1.customer_id = p0.customer_id
