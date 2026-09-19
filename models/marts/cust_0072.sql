select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t3 as t1,
    p2.t3 - p0.a3 as t2,
    p2.t3 as t3,
    p2.t3 as t4,
    p1.s4 * 0.5 + p0.a3 * 0.5 as t5,
    p0.a4 - p2.t3 as t6
from {{ ref('stg_cu_2') }} as p0
left join {{ ref('cust_0007') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0057') }} as p2 on p2.customer_id = p0.customer_id
