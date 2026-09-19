select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 as t1,
    case when p0.t3 > p1.s3 then p0.t3 else p1.s3 end as t2,
    p1.s3 as t3,
    p2.t4 as t4
from {{ ref('cust_0044') }} as p0
left join {{ ref('cust_0031') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0051') }} as p2 on p2.customer_id = p0.customer_id
