select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.a5 as t1,
    p0.s2 + p1.a5 as t2,
    p0.s2 as t3,
    case when p0.s2 > p1.a5 then p0.s2 else p1.a5 end as t4,
    p1.a5 as t5,
    p1.a5 + p0.s2 as t6
from {{ ref('cust_0624') }} as p0
left join {{ ref('stg_cu_2') }} as p1 on p1.customer_id = p0.customer_id
