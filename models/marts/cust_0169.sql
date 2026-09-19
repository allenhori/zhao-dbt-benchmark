select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p2.t2 > p1.t3 then p2.t2 else p1.t3 end as t1,
    p1.t3 + p2.t1 as t2,
    p1.t3 as t3,
    p1.t4 - p0.s2 as t4
from {{ ref('cust_0070') }} as p0
left join {{ ref('cust_0019') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0168') }} as p2 on p2.customer_id = p0.customer_id
