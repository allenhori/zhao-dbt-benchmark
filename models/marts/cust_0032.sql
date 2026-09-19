select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 as t1,
    p1.a2 as t2,
    p0.t4 as t3,
    p0.t4 as t4
from {{ ref('cust_0019') }} as p0
left join {{ ref('stg_cu_0') }} as p1 on p1.customer_id = p0.customer_id
