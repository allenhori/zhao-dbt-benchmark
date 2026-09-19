select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 * 0.5 + p0.t1 * 0.5 as t1,
    p1.t6 as t2,
    p2.s5 as t3,
    p2.s2 as t4
from {{ ref('cust_0100') }} as p0
left join {{ ref('cust_0027') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0005') }} as p2 on p2.customer_id = p0.customer_id
