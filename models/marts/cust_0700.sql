select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t5 as t1,
    case when p1.s1 > p0.t3 then p1.s1 else p0.t3 end as t2,
    p1.s1 - p0.t3 as t3,
    p1.s3 as t4,
    p0.t3 * 0.5 + p1.s1 * 0.5 as t5,
    p0.t3 as t6
from {{ ref('cust_0414') }} as p0
left join {{ ref('cust_0589') }} as p1 on p1.customer_id = p0.customer_id
