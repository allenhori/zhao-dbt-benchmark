select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s6 + p0.s3 as t1,
    p1.s1 as t2,
    p0.s2 as t3,
    p1.s1 - p0.s2 as t4,
    p0.s2 as t5,
    p1.s1 - p0.s2 as t6
from {{ ref('cust_0304') }} as p0
left join {{ ref('cust_0061') }} as p1 on p1.customer_id = p0.customer_id
