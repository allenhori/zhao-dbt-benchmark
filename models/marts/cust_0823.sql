select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t6 as t1,
    p2.t4 as t2,
    p1.t6 * 0.5 + p2.t4 * 0.5 as t3,
    p0.s4 as t4,
    p0.s5 - p1.t6 as t5
from {{ ref('cust_0715') }} as p0
left join {{ ref('cust_0801') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0687') }} as p2 on p2.customer_id = p0.customer_id
