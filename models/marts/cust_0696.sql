select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 as t1,
    p1.s2 as t2,
    p2.s4 as t3,
    p2.s4 as t4,
    p0.s3 + p1.s2 as t5
from {{ ref('cust_0295') }} as p0
left join {{ ref('cust_0636') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0578') }} as p2 on p2.customer_id = p0.customer_id
