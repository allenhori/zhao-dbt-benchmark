select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t2 as t1,
    p1.s3 as t2,
    p0.s2 as t3,
    p0.s3 as t4
from {{ ref('cust_0036') }} as p0
left join {{ ref('cust_0040') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0011') }} as p2 on p2.customer_id = p0.customer_id
