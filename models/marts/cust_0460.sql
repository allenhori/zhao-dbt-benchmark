select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t1 + p0.s4 as t1,
    p0.s1 + p2.t1 as t2,
    p1.t4 as t3,
    p1.t4 as t4,
    p0.s4 * 0.5 + p2.t4 * 0.5 as t5,
    p1.t2 as t6
from {{ ref('cust_0210') }} as p0
left join {{ ref('cust_0145') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0287') }} as p2 on p2.customer_id = p0.customer_id
