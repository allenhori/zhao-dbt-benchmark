select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 + p0.s2 as t1,
    case when p1.t5 > p0.s1 then p1.t5 else p0.s1 end as t2,
    p0.s2 as t3,
    p0.s2 as t4
from {{ ref('cust_0394') }} as p0
left join {{ ref('cust_0072') }} as p1 on p1.customer_id = p0.customer_id
