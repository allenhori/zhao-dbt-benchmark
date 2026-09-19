select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s6 as t1,
    p0.s6 as t2,
    case when p1.s3 > p0.s6 then p1.s3 else p0.s6 end as t3,
    p0.s6 - p1.s3 as t4
from {{ ref('cust_0398') }} as p0
left join {{ ref('cust_0238') }} as p1 on p1.customer_id = p0.customer_id
