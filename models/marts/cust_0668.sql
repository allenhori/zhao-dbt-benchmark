select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s6 as t1,
    p2.t3 as t2,
    p0.s2 as t3,
    p2.t2 as t4,
    p2.t2 - p1.t1 as t5
from {{ ref('cust_0115') }} as p0
left join {{ ref('cust_0294') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0455') }} as p2 on p2.customer_id = p0.customer_id
