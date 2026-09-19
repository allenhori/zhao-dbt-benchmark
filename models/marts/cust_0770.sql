select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s2 - p1.t5 as t1,
    case when p1.t5 > p0.s2 then p1.t5 else p0.s2 end as t2,
    case when p1.t1 > p0.s2 then p1.t1 else p0.s2 end as t3,
    p0.s2 as t4,
    p0.s2 as t5,
    p1.t1 * 0.5 + p0.s2 * 0.5 as t6
from {{ ref('cust_0342') }} as p0
left join {{ ref('cust_0157') }} as p1 on p1.customer_id = p0.customer_id
