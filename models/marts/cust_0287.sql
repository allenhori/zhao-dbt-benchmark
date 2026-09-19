select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s2 as t1,
    p2.s4 as t2,
    p0.s4 * 0.5 + p2.s4 * 0.5 as t3,
    p2.s4 * 0.5 + p1.t4 * 0.5 as t4,
    p0.s4 + p1.t3 as t5
from {{ ref('cust_0195') }} as p0
left join {{ ref('cust_0109') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0115') }} as p2 on p2.customer_id = p0.customer_id
