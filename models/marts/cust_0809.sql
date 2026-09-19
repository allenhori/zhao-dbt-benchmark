select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 as t1,
    p2.t4 + p0.t4 as t2,
    p2.t4 + p0.t5 as t3,
    p0.t4 - p2.t4 as t4
from {{ ref('cust_0712') }} as p0
left join {{ ref('cust_0395') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0283') }} as p2 on p2.customer_id = p0.customer_id
