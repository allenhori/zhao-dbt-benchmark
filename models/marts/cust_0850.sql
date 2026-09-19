select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p1.t2 as t2,
    p0.t4 as t3,
    p1.t3 as t4,
    p0.t4 as t5
from {{ ref('cust_0722') }} as p0
left join {{ ref('cust_0001') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0568') }} as p2 on p2.customer_id = p0.customer_id
