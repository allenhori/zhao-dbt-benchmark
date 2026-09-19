select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p2.t1 as t2,
    p0.t1 as t3,
    p2.t1 as t4,
    p1.t2 * 0.5 + p0.t3 * 0.5 as t5
from {{ ref('cust_0388') }} as p0
left join {{ ref('cust_0276') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0360') }} as p2 on p2.customer_id = p0.customer_id
