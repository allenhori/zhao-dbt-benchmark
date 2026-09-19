select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s2 as t1,
    p0.s1 as t2,
    p2.t1 as t3,
    p2.t1 - p1.s1 as t4
from {{ ref('cust_0082') }} as p0
left join {{ ref('cust_0515') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0030') }} as p2 on p2.customer_id = p0.customer_id
