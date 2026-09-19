select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t4 as t1,
    p2.t4 * 0.5 + p1.t1 * 0.5 as t2,
    p2.t4 as t3,
    case when p0.s1 > p1.t3 then p0.s1 else p1.t3 end as t4
from {{ ref('cust_0332') }} as p0
left join {{ ref('cust_0669') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0674') }} as p2 on p2.customer_id = p0.customer_id
