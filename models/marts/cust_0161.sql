select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t4 * 0.5 + p1.s6 * 0.5 as t1,
    p1.s5 - p2.t4 as t2,
    p1.s5 - p0.s3 as t3,
    case when p0.s3 > p1.s5 then p0.s3 else p1.s5 end as t4,
    p0.s4 + p1.s5 as t5,
    p2.t2 * 0.5 + p0.s4 * 0.5 as t6
from {{ ref('cust_0130') }} as p0
left join {{ ref('cust_0061') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0134') }} as p2 on p2.customer_id = p0.customer_id
