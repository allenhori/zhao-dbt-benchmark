select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s4 as t1,
    p2.s3 * 0.5 + p1.a4 * 0.5 as t2,
    p2.s3 as t3,
    p2.s2 as t4,
    p2.s3 as t5,
    p0.s4 - p2.s2 as t6
from {{ ref('cust_0136') }} as p0
left join {{ ref('stg_cu_3') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0090') }} as p2 on p2.customer_id = p0.customer_id
