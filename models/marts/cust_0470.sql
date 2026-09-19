select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t5 as t1,
    p0.t5 * 0.5 + p1.t1 * 0.5 as t2,
    p0.t5 + p1.t4 as t3,
    p1.t4 - p0.t5 as t4,
    p1.t1 - p0.t5 as t5
from {{ ref('cust_0047') }} as p0
left join {{ ref('cust_0066') }} as p1 on p1.customer_id = p0.customer_id
