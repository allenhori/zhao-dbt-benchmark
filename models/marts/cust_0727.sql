select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 as t1,
    p2.s5 as t2,
    p0.t4 * 0.5 + p1.t1 * 0.5 as t3,
    p2.s2 as t4,
    p2.s2 as t5
from {{ ref('cust_0020') }} as p0
left join {{ ref('cust_0065') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0345') }} as p2 on p2.customer_id = p0.customer_id
