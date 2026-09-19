select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.s2 > p2.s3 then p0.s2 else p2.s3 end as t1,
    p2.s3 as t2,
    p2.s1 as t3,
    p0.s2 as t4
from {{ ref('cust_0431') }} as p0
left join {{ ref('cust_0078') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0378') }} as p2 on p2.customer_id = p0.customer_id
