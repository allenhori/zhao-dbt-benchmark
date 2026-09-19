select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    p0.s4 + p1.t2 as t2,
    p1.t5 + p0.s4 as t3,
    p0.s1 as t4,
    p0.s4 - p1.t2 as t5
from {{ ref('cust_0203') }} as p0
left join {{ ref('cust_0139') }} as p1 on p1.customer_id = p0.customer_id
