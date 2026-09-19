select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 * 0.5 + p2.t4 * 0.5 as t1,
    p2.t4 + p1.t1 as t2,
    p2.t4 - p1.t1 as t3,
    p0.t1 as t4,
    p1.t1 - p2.t2 as t5,
    p1.t1 as t6
from {{ ref('cust_0094') }} as p0
left join {{ ref('cust_0032') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0119') }} as p2 on p2.customer_id = p0.customer_id
