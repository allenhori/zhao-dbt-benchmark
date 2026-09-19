select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s4 + p2.t4 as t1,
    p1.s4 as t2,
    p2.t4 - p0.s1 as t3,
    p2.t1 * 0.5 + p1.s3 * 0.5 as t4
from {{ ref('cust_0560') }} as p0
left join {{ ref('cust_0101') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0019') }} as p2 on p2.customer_id = p0.customer_id
