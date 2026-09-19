select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 as t1,
    p1.s3 + p0.t4 as t2,
    p0.t4 as t3,
    p0.t4 as t4,
    p1.s1 * 0.5 + p2.t3 * 0.5 as t5,
    p2.t2 as t6
from {{ ref('cust_0252') }} as p0
left join {{ ref('cust_0091') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0186') }} as p2 on p2.customer_id = p0.customer_id
