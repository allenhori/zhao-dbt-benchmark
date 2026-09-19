select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s1 - p1.s4 as t1,
    p2.s1 - p1.s4 as t2,
    p0.s4 as t3,
    p2.s1 as t4
from {{ ref('cust_0285') }} as p0
left join {{ ref('cust_0013') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0199') }} as p2 on p2.customer_id = p0.customer_id
