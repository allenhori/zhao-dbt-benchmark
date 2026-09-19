select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t2 as t1,
    p0.t2 * 0.5 + p1.s3 * 0.5 as t2,
    p0.t1 as t3,
    p2.t2 as t4,
    p1.s3 - p0.t1 as t5,
    p0.t1 as t6
from {{ ref('cust_0220') }} as p0
left join {{ ref('cust_0203') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0054') }} as p2 on p2.customer_id = p0.customer_id
