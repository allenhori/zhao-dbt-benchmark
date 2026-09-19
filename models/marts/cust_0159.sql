select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 as t1,
    p2.t1 * 0.5 + p0.s3 * 0.5 as t2,
    case when p1.t3 > p0.s1 then p1.t3 else p0.s1 end as t3,
    p1.t2 as t4,
    p2.t1 as t5,
    p1.t3 - p2.t2 as t6
from {{ ref('cust_0013') }} as p0
left join {{ ref('cust_0096') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0060') }} as p2 on p2.customer_id = p0.customer_id
