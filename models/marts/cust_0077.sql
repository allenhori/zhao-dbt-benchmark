select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a4 + p1.t6 as t1,
    p0.a4 as t2,
    p0.a4 + p1.t4 as t3,
    p1.t4 as t4,
    p0.a6 as t5,
    p0.a4 as t6
from {{ ref('stg_cu_2') }} as p0
left join {{ ref('cust_0027') }} as p1 on p1.customer_id = p0.customer_id
