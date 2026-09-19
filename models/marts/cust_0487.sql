select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t1 as t1,
    p1.t5 as t2,
    p1.t2 + p2.t1 as t3,
    p0.t3 as t4
from {{ ref('cust_0456') }} as p0
left join {{ ref('cust_0056') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0310') }} as p2 on p2.customer_id = p0.customer_id
