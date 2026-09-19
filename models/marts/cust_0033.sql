select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 as t1,
    p2.a5 as t2,
    p2.a5 as t3,
    p1.t1 as t4,
    p2.a1 + p0.s3 as t5
from {{ ref('cust_0014') }} as p0
left join {{ ref('cust_0026') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('stg_cu_2') }} as p2 on p2.customer_id = p0.customer_id
