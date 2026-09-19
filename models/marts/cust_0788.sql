select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s4 as t1,
    p0.t1 as t2,
    p2.t3 - p1.s4 as t3,
    p0.t4 as t4,
    p1.s1 as t5
from {{ ref('cust_0584') }} as p0
left join {{ ref('cust_0587') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0119') }} as p2 on p2.customer_id = p0.customer_id
