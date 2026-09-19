select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s3 > p0.t1 then p1.s3 else p0.t1 end as t1,
    p2.s3 + p1.s4 as t2,
    p0.t1 as t3,
    p0.t5 as t4
from {{ ref('cust_0047') }} as p0
left join {{ ref('cust_0290') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0005') }} as p2 on p2.customer_id = p0.customer_id
