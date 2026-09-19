select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 as t1,
    p0.s3 as t2,
    p2.s1 as t3,
    p2.s1 as t4,
    p1.t4 - p0.s3 as t5,
    p1.t4 as t6
from {{ ref('cust_0045') }} as p0
left join {{ ref('cust_0071') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0067') }} as p2 on p2.customer_id = p0.customer_id
