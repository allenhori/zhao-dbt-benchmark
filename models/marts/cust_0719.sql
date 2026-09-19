select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a5 + p1.t5 as t1,
    p0.a5 as t2,
    p1.t4 as t3,
    p1.t4 as t4
from {{ ref('stg_cu_2') }} as p0
left join {{ ref('cust_0517') }} as p1 on p1.customer_id = p0.customer_id
