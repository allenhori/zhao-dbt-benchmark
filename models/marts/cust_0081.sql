select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s1 as t1,
    p0.s1 as t2,
    p0.s2 as t3,
    p1.t5 as t4,
    p0.s2 as t5
from {{ ref('cust_0014') }} as p0
left join {{ ref('cust_0069') }} as p1 on p1.customer_id = p0.customer_id
