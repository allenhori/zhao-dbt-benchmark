select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 - p1.s5 as t1,
    p2.s3 as t2,
    p1.s5 as t3,
    case when p2.s2 > p0.s3 then p2.s2 else p0.s3 end as t4
from {{ ref('cust_0761') }} as p0
left join {{ ref('cust_0034') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0222') }} as p2 on p2.customer_id = p0.customer_id
