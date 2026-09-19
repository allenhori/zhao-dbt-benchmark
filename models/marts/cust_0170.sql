select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 as t1,
    p1.s1 as t2,
    p0.s3 - p1.s2 as t3,
    p1.s1 as t4,
    case when p1.s2 > p0.s2 then p1.s2 else p0.s2 end as t5,
    p0.s3 as t6
from {{ ref('cust_0093') }} as p0
left join {{ ref('cust_0007') }} as p1 on p1.customer_id = p0.customer_id
