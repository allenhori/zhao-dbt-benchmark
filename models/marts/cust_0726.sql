select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s4 as t1,
    p2.s2 as t2,
    p1.t1 + p0.s3 as t3,
    case when p2.s3 > p1.t1 then p2.s3 else p1.t1 end as t4,
    p0.s4 as t5,
    p0.s4 as t6
from {{ ref('cust_0210') }} as p0
left join {{ ref('cust_0612') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0059') }} as p2 on p2.customer_id = p0.customer_id
