select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t5 as t1,
    p0.s2 as t2,
    p0.s2 - p1.t2 as t3,
    p2.a1 as t4,
    p0.s4 as t5
from {{ ref('cust_0312') }} as p0
left join {{ ref('cust_0425') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('stg_cu_1') }} as p2 on p2.customer_id = p0.customer_id
