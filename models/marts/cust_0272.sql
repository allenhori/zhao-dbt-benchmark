select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 - p2.t2 as t1,
    p2.t2 - p0.s2 as t2,
    p1.t2 as t3,
    p0.s2 as t4,
    case when p1.t1 > p0.s2 then p1.t1 else p0.s2 end as t5,
    case when p2.t4 > p1.t2 then p2.t4 else p1.t2 end as t6
from {{ ref('cust_0005') }} as p0
left join {{ ref('cust_0239') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0256') }} as p2 on p2.customer_id = p0.customer_id
