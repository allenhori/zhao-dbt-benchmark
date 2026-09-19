select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 as t1,
    p0.t2 as t2,
    p0.t4 as t3,
    p0.t2 as t4,
    p0.t4 as t5,
    p2.s3 * 0.5 + p1.t2 * 0.5 as t6
from {{ ref('cust_0054') }} as p0
left join {{ ref('cust_0032') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0142') }} as p2 on p2.customer_id = p0.customer_id
