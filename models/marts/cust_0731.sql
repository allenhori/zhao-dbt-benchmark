select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    p1.t2 as t2,
    p1.t3 * 0.5 + p0.s3 * 0.5 as t3,
    case when p1.t3 > p0.s3 then p1.t3 else p0.s3 end as t4,
    case when p1.t3 > p0.s3 then p1.t3 else p0.s3 end as t5
from {{ ref('cust_0491') }} as p0
left join {{ ref('cust_0512') }} as p1 on p1.customer_id = p0.customer_id
