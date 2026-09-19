select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t3 as t1,
    p2.t1 as t2,
    p1.t4 + p0.s2 as t3,
    p1.t4 as t4,
    p2.t3 * 0.5 + p0.s1 * 0.5 as t5,
    p2.t1 as t6
from {{ ref('cust_0082') }} as p0
left join {{ ref('cust_0268') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0300') }} as p2 on p2.customer_id = p0.customer_id
