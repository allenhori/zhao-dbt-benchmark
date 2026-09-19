select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s2 - p0.t2 as t1,
    p0.t3 - p1.s5 as t2,
    p1.s2 + p0.t2 as t3,
    p1.s5 * 0.5 + p0.t2 * 0.5 as t4
from {{ ref('cust_0220') }} as p0
left join {{ ref('cust_0108') }} as p1 on p1.customer_id = p0.customer_id
