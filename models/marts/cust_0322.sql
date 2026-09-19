select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s4 + p0.s1 as t1,
    p1.s4 as t2,
    p1.s3 as t3,
    p1.s4 * 0.5 + p0.s1 * 0.5 as t4
from {{ ref('cust_0135') }} as p0
left join {{ ref('cust_0238') }} as p1 on p1.customer_id = p0.customer_id
