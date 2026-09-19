select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t6 as t1,
    p0.t2 as t2,
    p0.t2 as t3,
    p0.t1 * 0.5 + p1.t6 * 0.5 as t4,
    p0.t1 as t5,
    p0.t2 as t6
from {{ ref('cust_0011') }} as p0
left join {{ ref('cust_0025') }} as p1 on p1.customer_id = p0.customer_id
