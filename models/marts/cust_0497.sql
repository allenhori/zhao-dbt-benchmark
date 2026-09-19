select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 + p1.s4 as t1,
    p0.t1 as t2,
    p1.s4 * 0.5 + p2.s2 * 0.5 as t3,
    p0.t1 as t4
from {{ ref('cust_0448') }} as p0
left join {{ ref('cust_0223') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0002') }} as p2 on p2.customer_id = p0.customer_id
