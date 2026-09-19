select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t5 as t1,
    p2.t6 as t2,
    p2.t6 - p0.t1 as t3,
    p0.t5 * 0.5 + p1.t2 * 0.5 as t4,
    case when p2.t1 > p0.t5 then p2.t1 else p0.t5 end as t5
from {{ ref('cust_0484') }} as p0
left join {{ ref('cust_0170') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0525') }} as p2 on p2.customer_id = p0.customer_id
