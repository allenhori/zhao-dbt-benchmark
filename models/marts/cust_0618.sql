select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    case when p2.t1 > p0.t1 then p2.t1 else p0.t1 end as t2,
    p0.t1 as t3,
    p1.s2 * 0.5 + p0.t1 * 0.5 as t4,
    p0.t6 * 0.5 + p1.s4 * 0.5 as t5,
    p1.s4 as t6
from {{ ref('cust_0194') }} as p0
left join {{ ref('cust_0317') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0318') }} as p2 on p2.customer_id = p0.customer_id
