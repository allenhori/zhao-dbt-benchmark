select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 + p2.t5 as t1,
    p0.t1 as t2,
    p0.t3 - p1.t1 as t3,
    p0.t1 + p2.t5 as t4,
    p2.t4 as t5,
    p1.t4 as t6
from {{ ref('cust_0604') }} as p0
left join {{ ref('cust_0616') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0103') }} as p2 on p2.customer_id = p0.customer_id
