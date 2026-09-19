select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t2 as t1,
    p0.t2 as t2,
    p0.t3 + p1.t4 as t3,
    p0.t3 as t4,
    p2.t4 as t5,
    p0.t3 as t6
from {{ ref('cust_0616') }} as p0
left join {{ ref('cust_0664') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0780') }} as p2 on p2.customer_id = p0.customer_id
