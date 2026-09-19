select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 - p1.t2 as t1,
    p0.t3 - p2.t5 as t2,
    p0.t1 as t3,
    p1.t2 * 0.5 + p0.t1 * 0.5 as t4
from {{ ref('cust_0032') }} as p0
left join {{ ref('cust_0011') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0050') }} as p2 on p2.customer_id = p0.customer_id
