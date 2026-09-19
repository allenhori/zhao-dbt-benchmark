select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 * 0.5 + p2.t2 * 0.5 as t1,
    p0.s1 * 0.5 + p2.t4 * 0.5 as t2,
    p1.t4 as t3,
    p0.s1 * 0.5 + p2.t4 * 0.5 as t4
from {{ ref('cust_0340') }} as p0
left join {{ ref('cust_0064') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0024') }} as p2 on p2.customer_id = p0.customer_id
