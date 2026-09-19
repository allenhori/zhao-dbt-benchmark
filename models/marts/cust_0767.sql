select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 as t1,
    p0.t2 + p2.s2 as t2,
    p0.t2 as t3,
    p1.t1 as t4,
    p0.t2 as t5
from {{ ref('cust_0018') }} as p0
left join {{ ref('cust_0253') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0089') }} as p2 on p2.customer_id = p0.customer_id
