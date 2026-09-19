select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s1 as t1,
    p0.t2 as t2,
    p0.t3 - p1.s1 as t3,
    p1.s2 as t4,
    p0.t3 as t5
from {{ ref('cust_0407') }} as p0
left join {{ ref('cust_0274') }} as p1 on p1.customer_id = p0.customer_id
