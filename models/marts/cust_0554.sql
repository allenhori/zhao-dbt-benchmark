select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s1 as t1,
    p1.s4 as t2,
    p1.s4 as t3,
    p1.s1 * 0.5 + p0.t2 * 0.5 as t4,
    p2.t1 + p0.t2 as t5,
    p0.t2 as t6
from {{ ref('cust_0509') }} as p0
left join {{ ref('cust_0316') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0412') }} as p2 on p2.customer_id = p0.customer_id
