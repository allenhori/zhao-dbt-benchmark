select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 * 0.5 + p1.s3 * 0.5 as t1,
    p1.s3 as t2,
    p1.s3 - p0.t3 as t3,
    p1.s3 as t4,
    case when p0.t5 > p1.s3 then p0.t5 else p1.s3 end as t5,
    p1.s1 as t6
from {{ ref('cust_0170') }} as p0
left join {{ ref('cust_0129') }} as p1 on p1.customer_id = p0.customer_id
