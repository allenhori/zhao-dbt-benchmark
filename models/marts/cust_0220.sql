select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s3 as t1,
    p1.s5 * 0.5 + p0.t2 * 0.5 as t2,
    p0.t4 + p1.s2 as t3,
    p1.s2 as t4
from {{ ref('cust_0138') }} as p0
left join {{ ref('cust_0156') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0117') }} as p2 on p2.customer_id = p0.customer_id
