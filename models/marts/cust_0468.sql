select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t4 as t1,
    case when p0.t6 > p2.t3 then p0.t6 else p2.t3 end as t2,
    p1.t4 * 0.5 + p2.t3 * 0.5 as t3,
    p0.t6 as t4,
    p0.t6 - p2.t4 as t5
from {{ ref('cust_0338') }} as p0
left join {{ ref('cust_0310') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0137') }} as p2 on p2.customer_id = p0.customer_id
