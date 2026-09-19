select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t2 * 0.5 + p2.t4 * 0.5 as t1,
    p0.t2 as t2,
    p0.t4 as t3,
    p2.t2 as t4
from {{ ref('cust_0035') }} as p0
left join {{ ref('cust_0018') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0162') }} as p2 on p2.customer_id = p0.customer_id
