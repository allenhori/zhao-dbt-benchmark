select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p0.t3 as t2,
    p0.t2 as t3,
    case when p0.t2 > p1.s2 then p0.t2 else p1.s2 end as t4,
    case when p0.t3 > p1.s3 then p0.t3 else p1.s3 end as t5,
    p0.t2 - p1.s3 as t6
from {{ ref('cust_0029') }} as p0
left join {{ ref('cust_0391') }} as p1 on p1.customer_id = p0.customer_id
