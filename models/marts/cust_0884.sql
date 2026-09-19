select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t2 as t1,
    p0.t2 as t2,
    p0.t1 + p1.t3 as t3,
    p1.t3 as t4,
    p0.t2 as t5,
    p1.t3 - p0.t1 as t6
from {{ ref('cust_0100') }} as p0
left join {{ ref('cust_0137') }} as p1 on p1.customer_id = p0.customer_id
