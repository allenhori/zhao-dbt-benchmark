select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s1 * 0.5 + p1.t2 * 0.5 as t1,
    p1.t2 as t2,
    p0.s1 as t3,
    p0.s6 as t4,
    p1.t2 as t5,
    p1.t1 as t6
from {{ ref('cust_0514') }} as p0
left join {{ ref('cust_0221') }} as p1 on p1.customer_id = p0.customer_id
