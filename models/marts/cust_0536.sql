select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t2 + p0.s1 as t1,
    p1.t2 as t2,
    p1.t2 * 0.5 + p2.t5 * 0.5 as t3,
    p2.t2 as t4
from {{ ref('cust_0457') }} as p0
left join {{ ref('cust_0448') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0397') }} as p2 on p2.customer_id = p0.customer_id
