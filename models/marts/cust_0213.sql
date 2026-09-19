select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s4 + p0.t1 as t1,
    p1.s1 as t2,
    p1.s1 as t3,
    p1.s4 * 0.5 + p0.t1 * 0.5 as t4
from {{ ref('cust_0047') }} as p0
left join {{ ref('cust_0005') }} as p1 on p1.customer_id = p0.customer_id
