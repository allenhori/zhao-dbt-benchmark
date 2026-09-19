select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s1 as t1,
    p1.s4 - p2.s4 as t2,
    p0.s2 as t3,
    p1.s5 as t4,
    p2.s1 as t5,
    p0.s3 as t6
from {{ ref('cust_0496') }} as p0
left join {{ ref('cust_0676') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0215') }} as p2 on p2.customer_id = p0.customer_id
