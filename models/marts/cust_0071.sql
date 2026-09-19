select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    case when p1.s2 > p0.t2 then p1.s2 else p0.t2 end as t2,
    p0.t1 - p1.s2 as t3,
    p1.s4 as t4,
    p0.t2 as t5,
    p0.t1 * 0.5 + p1.s4 * 0.5 as t6
from {{ ref('cust_0035') }} as p0
left join {{ ref('cust_0034') }} as p1 on p1.customer_id = p0.customer_id
