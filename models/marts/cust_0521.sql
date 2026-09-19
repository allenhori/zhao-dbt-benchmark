select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    p2.s2 as t2,
    p2.s2 as t3,
    p1.t5 as t4,
    p1.t5 - p0.s2 as t5
from {{ ref('cust_0217') }} as p0
left join {{ ref('cust_0161') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0467') }} as p2 on p2.customer_id = p0.customer_id
