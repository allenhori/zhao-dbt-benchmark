select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s4 as t1,
    p2.t4 as t2,
    p0.s2 - p1.t4 as t3,
    p0.s2 * 0.5 + p1.t3 * 0.5 as t4,
    p0.s2 * 0.5 + p1.t4 * 0.5 as t5,
    case when p1.t3 > p0.s2 then p1.t3 else p0.s2 end as t6
from {{ ref('cust_0558') }} as p0
left join {{ ref('cust_0246') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0640') }} as p2 on p2.customer_id = p0.customer_id
