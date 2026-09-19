select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 + p0.s5 as t1,
    p0.s5 - p1.t3 as t2,
    p1.t2 + p0.s5 as t3,
    case when p0.s3 > p1.t2 then p0.s3 else p1.t2 end as t4,
    p1.t3 as t5,
    p1.t2 + p0.s3 as t6
from {{ ref('cust_0124') }} as p0
left join {{ ref('cust_0073') }} as p1 on p1.customer_id = p0.customer_id
