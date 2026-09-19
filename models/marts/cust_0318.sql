select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s2 as t1,
    p1.t1 as t2,
    p1.t4 as t3,
    p1.t4 as t4,
    p2.s2 * 0.5 + p1.t4 * 0.5 as t5,
    p1.t1 as t6
from {{ ref('cust_0261') }} as p0
left join {{ ref('cust_0281') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0208') }} as p2 on p2.customer_id = p0.customer_id
