select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t3 as t1,
    p2.t3 * 0.5 + p1.t1 * 0.5 as t2,
    p1.t1 as t3,
    p2.t1 as t4
from {{ ref('cust_0083') }} as p0
left join {{ ref('cust_0054') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0044') }} as p2 on p2.customer_id = p0.customer_id
