select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t1 as t1,
    p0.s1 * 0.5 + p2.t2 * 0.5 as t2,
    p2.t2 as t3,
    p1.s3 as t4,
    case when p2.t1 > p0.s1 then p2.t1 else p0.s1 end as t5,
    p0.s1 as t6
from {{ ref('cust_0070') }} as p0
left join {{ ref('cust_0052') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0075') }} as p2 on p2.customer_id = p0.customer_id
