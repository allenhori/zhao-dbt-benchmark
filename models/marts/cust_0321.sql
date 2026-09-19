select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s2 as t1,
    p0.t1 as t2,
    p0.t1 as t3,
    p0.t4 as t4,
    p1.s3 as t5
from {{ ref('cust_0201') }} as p0
left join {{ ref('cust_0235') }} as p1 on p1.customer_id = p0.customer_id
