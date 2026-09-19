select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s5 as t1,
    p1.s2 as t2,
    p1.s3 * 0.5 + p0.s5 * 0.5 as t3,
    p1.s3 as t4,
    p1.s2 as t5,
    p1.s3 as t6
from {{ ref('cust_0040') }} as p0
left join {{ ref('cust_0314') }} as p1 on p1.customer_id = p0.customer_id
