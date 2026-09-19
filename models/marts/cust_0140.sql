select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s5 as t1,
    case when p0.a1 > p1.s1 then p0.a1 else p1.s1 end as t2,
    p0.a1 as t3,
    p2.s5 as t4,
    p2.s5 as t5
from {{ ref('stg_cu_2') }} as p0
left join {{ ref('cust_0041') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0012') }} as p2 on p2.customer_id = p0.customer_id
