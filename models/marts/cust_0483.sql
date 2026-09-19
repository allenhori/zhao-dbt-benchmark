select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a2 as t1,
    case when p1.t4 > p0.a2 then p1.t4 else p0.a2 end as t2,
    p0.a2 * 0.5 + p1.t1 * 0.5 as t3,
    p1.t1 as t4
from {{ ref('stg_cu_2') }} as p0
left join {{ ref('cust_0110') }} as p1 on p1.customer_id = p0.customer_id
