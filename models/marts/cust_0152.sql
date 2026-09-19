select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s2 as t1,
    p1.t4 - p0.s3 as t2,
    p0.s2 * 0.5 + p1.t3 * 0.5 as t3,
    case when p0.s2 > p1.t4 then p0.s2 else p1.t4 end as t4,
    p1.t4 + p0.s3 as t5
from {{ ref('cust_0003') }} as p0
left join {{ ref('cust_0030') }} as p1 on p1.customer_id = p0.customer_id
