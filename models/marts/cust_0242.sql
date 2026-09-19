select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.a6 as t1,
    p2.t4 * 0.5 + p1.a3 * 0.5 as t2,
    p0.s1 as t3,
    case when p1.a6 > p2.t3 then p1.a6 else p2.t3 end as t4
from {{ ref('cust_0203') }} as p0
left join {{ ref('stg_cu_0') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0173') }} as p2 on p2.customer_id = p0.customer_id
