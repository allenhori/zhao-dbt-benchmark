select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 as t1,
    p2.t1 as t2,
    case when p2.t3 > p0.s1 then p2.t3 else p0.s1 end as t3,
    p2.t1 as t4,
    p0.s1 as t5,
    p2.t1 as t6
from {{ ref('cust_0036') }} as p0
left join {{ ref('cust_0011') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0216') }} as p2 on p2.customer_id = p0.customer_id
