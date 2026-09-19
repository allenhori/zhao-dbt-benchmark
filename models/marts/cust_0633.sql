select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s3 as t1,
    p1.t4 as t2,
    p2.s3 as t3,
    case when p0.t1 > p2.s3 then p0.t1 else p2.s3 end as t4
from {{ ref('cust_0260') }} as p0
left join {{ ref('cust_0565') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0601') }} as p2 on p2.customer_id = p0.customer_id
