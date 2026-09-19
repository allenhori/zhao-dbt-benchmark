select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s6 as t1,
    p1.s6 as t2,
    p2.s4 as t3,
    p2.s4 as t4,
    p1.s3 as t5,
    p2.s4 as t6
from {{ ref('cust_0091') }} as p0
left join {{ ref('cust_0132') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0124') }} as p2 on p2.customer_id = p0.customer_id
