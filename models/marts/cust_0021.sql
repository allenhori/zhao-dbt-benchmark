select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t6 as t1,
    p1.s3 as t2,
    p1.s3 + p0.t1 as t3,
    p1.s1 as t4
from {{ ref('cust_0004') }} as p0
left join {{ ref('cust_0003') }} as p1 on p1.customer_id = p0.customer_id
