select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    p1.t3 - p0.a4 as t2,
    p1.t2 as t3,
    p1.t2 as t4,
    p0.a5 as t5
from {{ ref('stg_cu_3') }} as p0
left join {{ ref('cust_0010') }} as p1 on p1.customer_id = p0.customer_id
