select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 as t1,
    p0.s2 as t2,
    p1.t1 as t3,
    case when p0.s3 > p1.t1 then p0.s3 else p1.t1 end as t4,
    p0.s2 as t5,
    p1.t1 as t6
from {{ ref('cust_0014') }} as p0
left join {{ ref('cust_0278') }} as p1 on p1.customer_id = p0.customer_id
