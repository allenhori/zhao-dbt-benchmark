select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a5 as t1,
    p1.s3 + p2.t2 as t2,
    p0.a3 as t3,
    p1.s1 * 0.5 + p0.a5 * 0.5 as t4,
    p1.s1 as t5,
    p1.s1 as t6
from {{ ref('stg_cu_2') }} as p0
left join {{ ref('cust_0082') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0155') }} as p2 on p2.customer_id = p0.customer_id
