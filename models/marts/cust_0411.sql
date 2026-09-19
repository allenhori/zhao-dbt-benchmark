select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s2 + p0.t2 as t1,
    p0.t1 as t2,
    p1.s6 * 0.5 + p0.t2 * 0.5 as t3,
    p1.s2 as t4,
    p0.t2 as t5,
    case when p1.s2 > p0.t1 then p1.s2 else p0.t1 end as t6
from {{ ref('cust_0243') }} as p0
left join {{ ref('cust_0106') }} as p1 on p1.customer_id = p0.customer_id
