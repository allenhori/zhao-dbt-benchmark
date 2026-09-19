select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s2 as t1,
    p1.s4 * 0.5 + p0.t2 * 0.5 as t2,
    p2.s5 + p0.t2 as t3,
    p1.s4 - p2.s3 as t4
from {{ ref('cust_0354') }} as p0
left join {{ ref('cust_0432') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0190') }} as p2 on p2.customer_id = p0.customer_id
