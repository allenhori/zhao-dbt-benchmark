select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s1 - p0.t4 as t1,
    case when p2.s1 > p0.t4 then p2.s1 else p0.t4 end as t2,
    p1.t2 as t3,
    p0.t4 * 0.5 + p1.t5 * 0.5 as t4,
    p2.s1 as t5,
    p0.t2 + p1.t5 as t6
from {{ ref('cust_0137') }} as p0
left join {{ ref('cust_0024') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0012') }} as p2 on p2.customer_id = p0.customer_id
