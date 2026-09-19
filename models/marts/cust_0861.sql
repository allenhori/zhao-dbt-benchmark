select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t1 > p1.s2 then p0.t1 else p1.s2 end as t1,
    p0.t3 * 0.5 + p1.s1 * 0.5 as t2,
    p0.t1 * 0.5 + p1.s2 * 0.5 as t3,
    p0.t3 as t4,
    p1.s2 as t5
from {{ ref('cust_0411') }} as p0
left join {{ ref('cust_0357') }} as p1 on p1.customer_id = p0.customer_id
