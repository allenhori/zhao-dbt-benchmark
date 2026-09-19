select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s2 * 0.5 + p1.s2 * 0.5 as t1,
    p1.s5 as t2,
    p1.s5 as t3,
    p1.s2 as t4,
    p1.s5 - p0.s2 as t5
from {{ ref('cust_0199') }} as p0
left join {{ ref('cust_0175') }} as p1 on p1.customer_id = p0.customer_id
