select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s2 > p0.s3 then p1.s2 else p0.s3 end as t1,
    p0.s3 * 0.5 + p1.s2 * 0.5 as t2,
    p0.s2 as t3,
    p1.s2 as t4,
    p1.s4 as t5
from {{ ref('cust_0558') }} as p0
left join {{ ref('cust_0101') }} as p1 on p1.customer_id = p0.customer_id
