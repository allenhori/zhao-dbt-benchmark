select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p2.t5 > p0.t4 then p2.t5 else p0.t4 end as t1,
    p2.t5 as t2,
    p2.t6 as t3,
    p2.t5 as t4,
    p2.t6 - p1.t4 as t5,
    p0.t4 as t6
from {{ ref('cust_0088') }} as p0
left join {{ ref('cust_0044') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0066') }} as p2 on p2.customer_id = p0.customer_id
