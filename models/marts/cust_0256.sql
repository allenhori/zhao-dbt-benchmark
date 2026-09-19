select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s5 as t1,
    p1.t2 as t2,
    p0.t1 as t3,
    p2.s5 as t4,
    p1.t2 as t5,
    p1.t2 as t6
from {{ ref('cust_0121') }} as p0
left join {{ ref('cust_0224') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0206') }} as p2 on p2.customer_id = p0.customer_id
