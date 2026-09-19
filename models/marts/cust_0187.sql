select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s2 + p1.t3 as t1,
    p0.s4 - p1.t1 as t2,
    case when p0.s4 > p1.t3 then p0.s4 else p1.t3 end as t3,
    p0.s2 * 0.5 + p1.t1 * 0.5 as t4,
    p0.s4 as t5
from {{ ref('cust_0014') }} as p0
left join {{ ref('cust_0051') }} as p1 on p1.customer_id = p0.customer_id
