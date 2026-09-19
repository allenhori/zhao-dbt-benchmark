select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.a1 as t1,
    p1.a1 as t2,
    p1.a4 as t3,
    p1.a1 as t4,
    p0.t4 as t5,
    p0.t3 as t6
from {{ ref('cust_0127') }} as p0
left join {{ ref('stg_cu_1') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0172') }} as p2 on p2.customer_id = p0.customer_id
