select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.s2 > p1.s3 then p0.s2 else p1.s3 end as t1,
    p2.s2 as t2,
    p0.s3 - p1.s4 as t3,
    p1.s3 as t4,
    p1.s3 as t5
from {{ ref('cust_0041') }} as p0
left join {{ ref('cust_0028') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0012') }} as p2 on p2.customer_id = p0.customer_id
