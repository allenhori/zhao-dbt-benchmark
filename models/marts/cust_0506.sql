select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 - p0.s2 as t1,
    p1.t3 as t2,
    p0.s2 as t3,
    p0.s2 * 0.5 + p1.t2 * 0.5 as t4
from {{ ref('cust_0210') }} as p0
left join {{ ref('cust_0300') }} as p1 on p1.customer_id = p0.customer_id
