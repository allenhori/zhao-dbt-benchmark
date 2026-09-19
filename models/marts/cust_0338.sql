select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t5 as t1,
    p0.s2 * 0.5 + p1.t6 * 0.5 as t2,
    p0.s2 as t3,
    case when p0.s4 > p1.t6 then p0.s4 else p1.t6 end as t4,
    p0.s2 as t5,
    case when p1.t6 > p0.s2 then p1.t6 else p0.s2 end as t6
from {{ ref('cust_0174') }} as p0
left join {{ ref('cust_0027') }} as p1 on p1.customer_id = p0.customer_id
