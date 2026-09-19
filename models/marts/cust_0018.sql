select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s1 as t1,
    p1.s1 as t2,
    p1.s2 as t3,
    p0.t4 as t4,
    case when p2.s2 > p0.t1 then p2.s2 else p0.t1 end as t5
from {{ ref('cust_0010') }} as p0
left join {{ ref('cust_0000') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0005') }} as p2 on p2.customer_id = p0.customer_id
