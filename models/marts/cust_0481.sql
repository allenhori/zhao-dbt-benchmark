select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p0.t3 * 0.5 + p1.s3 * 0.5 as t2,
    p1.s2 * 0.5 + p0.t3 * 0.5 as t3,
    p0.t3 * 0.5 + p1.s3 * 0.5 as t4
from {{ ref('cust_0350') }} as p0
left join {{ ref('cust_0341') }} as p1 on p1.customer_id = p0.customer_id
