select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 as t1,
    p1.t1 + p0.s4 as t2,
    p0.s4 as t3,
    p0.s3 as t4,
    p1.t4 as t5,
    p1.t4 as t6
from {{ ref('cust_0637') }} as p0
left join {{ ref('cust_0727') }} as p1 on p1.customer_id = p0.customer_id
