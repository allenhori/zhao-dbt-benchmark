select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t2 - p1.a5 as t1,
    p0.t3 as t2,
    p0.t2 + p1.a6 as t3,
    p1.a6 - p0.t2 as t4,
    case when p1.a6 > p0.t2 then p1.a6 else p0.t2 end as t5
from {{ ref('cust_0016') }} as p0
left join {{ ref('stg_cu_2') }} as p1 on p1.customer_id = p0.customer_id
