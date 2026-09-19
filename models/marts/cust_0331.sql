select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 * 0.5 + p2.s1 * 0.5 as t1,
    p1.t2 as t2,
    p2.s1 as t3,
    p1.t5 as t4,
    case when p1.t2 > p2.s3 then p1.t2 else p2.s3 end as t5
from {{ ref('cust_0226') }} as p0
left join {{ ref('cust_0011') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0130') }} as p2 on p2.customer_id = p0.customer_id
