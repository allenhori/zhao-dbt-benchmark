select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s5 * 0.5 + p1.s2 * 0.5 as t1,
    p1.s5 as t2,
    p0.s4 as t3,
    p2.s2 as t4,
    p0.s5 as t5,
    p2.s2 as t6
from {{ ref('cust_0314') }} as p0
left join {{ ref('cust_0258') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0052') }} as p2 on p2.customer_id = p0.customer_id
