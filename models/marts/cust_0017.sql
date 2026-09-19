select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 as t1,
    p1.s3 as t2,
    p0.s4 as t3,
    case when p1.s4 > p2.t2 then p1.s4 else p2.t2 end as t4,
    p1.s4 + p2.t4 as t5,
    p0.s3 as t6
from {{ ref('cust_0008') }} as p0
left join {{ ref('cust_0014') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0009') }} as p2 on p2.customer_id = p0.customer_id
