select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.a1 as t1,
    p1.a3 + p2.t2 as t2,
    p1.a1 as t3,
    p2.t3 as t4,
    case when p0.t1 > p1.a3 then p0.t1 else p1.a3 end as t5,
    p1.a1 as t6
from {{ ref('cust_0032') }} as p0
left join {{ ref('stg_cu_2') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0016') }} as p2 on p2.customer_id = p0.customer_id
