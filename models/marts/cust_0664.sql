select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s2 as t1,
    p1.t2 as t2,
    p0.s2 as t3,
    p1.t4 + p0.s2 as t4,
    p1.t4 as t5
from {{ ref('cust_0126') }} as p0
left join {{ ref('cust_0439') }} as p1 on p1.customer_id = p0.customer_id
