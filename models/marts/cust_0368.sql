select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a5 as t1,
    p0.a5 as t2,
    case when p1.t2 > p2.t1 then p1.t2 else p2.t1 end as t3,
    p0.a3 as t4
from {{ ref('stg_cu_3') }} as p0
left join {{ ref('cust_0213') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0154') }} as p2 on p2.customer_id = p0.customer_id
