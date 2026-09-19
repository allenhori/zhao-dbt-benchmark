select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t1 > p1.s5 then p0.t1 else p1.s5 end as t1,
    p1.s5 * 0.5 + p0.t1 * 0.5 as t2,
    p1.s1 - p0.t1 as t3,
    p1.s1 as t4
from {{ ref('cust_0278') }} as p0
left join {{ ref('cust_0431') }} as p1 on p1.customer_id = p0.customer_id
