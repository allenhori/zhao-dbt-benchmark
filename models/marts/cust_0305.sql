select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 as t1,
    p0.s3 + p2.s4 as t2,
    case when p0.s3 > p1.s1 then p0.s3 else p1.s1 end as t3,
    p0.s3 * 0.5 + p1.s1 * 0.5 as t4
from {{ ref('cust_0031') }} as p0
left join {{ ref('cust_0087') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0164') }} as p2 on p2.customer_id = p0.customer_id
