select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 as t1,
    p0.s2 + p1.t1 as t2,
    p0.s2 * 0.5 + p1.t4 * 0.5 as t3,
    p1.t4 + p0.s3 as t4
from {{ ref('cust_0593') }} as p0
left join {{ ref('cust_0351') }} as p1 on p1.customer_id = p0.customer_id
