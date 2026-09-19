select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s5 as t1,
    p0.s5 as t2,
    p1.t4 as t3,
    p0.s1 as t4,
    p1.t2 as t5,
    p2.t3 as t6
from {{ ref('cust_0068') }} as p0
left join {{ ref('cust_0051') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0039') }} as p2 on p2.customer_id = p0.customer_id
