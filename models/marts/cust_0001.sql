select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.a2 as t1,
    p1.a4 as t2,
    p2.s2 as t3,
    case when p0.a5 > p2.s3 then p0.a5 else p2.s3 end as t4,
    case when p2.s3 > p1.a2 then p2.s3 else p1.a2 end as t5,
    p2.s3 - p0.a6 as t6
from {{ ref('stg_cu_1') }} as p0
left join {{ ref('stg_cu_2') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0000') }} as p2 on p2.customer_id = p0.customer_id
