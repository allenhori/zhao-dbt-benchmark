select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 as t1,
    p1.t4 as t2,
    p1.t3 * 0.5 + p0.t2 * 0.5 as t3,
    p0.t4 - p1.t4 as t4,
    p0.t4 as t5
from {{ ref('cust_0029') }} as p0
left join {{ ref('cust_0708') }} as p1 on p1.customer_id = p0.customer_id
