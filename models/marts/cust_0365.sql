select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t6 as t1,
    p2.t2 + p1.t6 as t2,
    case when p2.t2 > p0.s2 then p2.t2 else p0.s2 end as t3,
    p1.t6 as t4
from {{ ref('cust_0117') }} as p0
left join {{ ref('cust_0123') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0224') }} as p2 on p2.customer_id = p0.customer_id
