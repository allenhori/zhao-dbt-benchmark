select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a2 as t1,
    p1.s1 * 0.5 + p0.a4 * 0.5 as t2,
    p0.a4 + p2.a4 as t3,
    p1.s1 as t4
from {{ ref('stg_cu_0') }} as p0
left join {{ ref('cust_0013') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('stg_cu_2') }} as p2 on p2.customer_id = p0.customer_id
