select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.s6 > p2.s2 then p0.s6 else p2.s2 end as t1,
    p2.s2 as t2,
    p2.s4 * 0.5 + p0.s5 * 0.5 as t3,
    p0.s6 - p1.t3 as t4
from {{ ref('cust_0090') }} as p0
left join {{ ref('cust_0109') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0043') }} as p2 on p2.customer_id = p0.customer_id
