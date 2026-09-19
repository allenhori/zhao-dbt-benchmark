select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t5 - p0.s1 as t1,
    p1.t3 as t2,
    p1.t5 as t3,
    p0.s2 as t4,
    p1.t3 as t5,
    p0.s1 as t6
from {{ ref('cust_0093') }} as p0
left join {{ ref('cust_0148') }} as p1 on p1.customer_id = p0.customer_id
