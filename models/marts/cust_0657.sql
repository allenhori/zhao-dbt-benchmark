select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s1 as t1,
    p2.s1 as t2,
    p1.t1 * 0.5 + p2.s2 * 0.5 as t3,
    p1.t1 - p2.s2 as t4
from {{ ref('cust_0175') }} as p0
left join {{ ref('cust_0305') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0473') }} as p2 on p2.customer_id = p0.customer_id
