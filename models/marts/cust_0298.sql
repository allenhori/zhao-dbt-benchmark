select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 + p0.s2 as t1,
    p0.s4 * 0.5 + p1.s2 * 0.5 as t2,
    case when p0.s2 > p1.s2 then p0.s2 else p1.s2 end as t3,
    p0.s2 * 0.5 + p1.s2 * 0.5 as t4,
    p0.s2 * 0.5 + p1.s3 * 0.5 as t5,
    p1.s3 as t6
from {{ ref('cust_0101') }} as p0
left join {{ ref('cust_0061') }} as p1 on p1.customer_id = p0.customer_id
