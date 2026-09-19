select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 as t1,
    p0.t4 * 0.5 + p1.t2 * 0.5 as t2,
    p0.t4 * 0.5 + p1.t4 * 0.5 as t3,
    p1.t2 as t4,
    p0.t4 as t5
from {{ ref('cust_0396') }} as p0
left join {{ ref('cust_0060') }} as p1 on p1.customer_id = p0.customer_id
