select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t4 as t1,
    case when p1.s4 > p2.t1 then p1.s4 else p2.t1 end as t2,
    p1.s4 - p2.t1 as t3,
    p1.s4 * 0.5 + p0.s5 * 0.5 as t4,
    p1.s2 as t5,
    p2.t1 - p1.s2 as t6
from {{ ref('cust_0061') }} as p0
left join {{ ref('cust_0005') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0010') }} as p2 on p2.customer_id = p0.customer_id
