select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s4 as t1,
    p1.s4 as t2,
    p0.s1 as t3,
    p1.s4 as t4,
    p0.s1 * 0.5 + p1.s4 * 0.5 as t5,
    p1.s4 + p0.s4 as t6
from {{ ref('cust_0028') }} as p0
left join {{ ref('cust_0042') }} as p1 on p1.customer_id = p0.customer_id
