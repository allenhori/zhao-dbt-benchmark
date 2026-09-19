select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s1 + p1.s1 as t1,
    p1.s1 - p0.s1 as t2,
    p1.s1 as t3,
    p1.s1 - p0.s2 as t4,
    p0.s1 as t5,
    p0.s1 + p1.s2 as t6
from {{ ref('cust_0031') }} as p0
left join {{ ref('cust_0214') }} as p1 on p1.customer_id = p0.customer_id
