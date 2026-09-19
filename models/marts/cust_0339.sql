select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t4 > p1.s5 then p0.t4 else p1.s5 end as t1,
    p1.s5 as t2,
    p0.t2 * 0.5 + p1.s3 * 0.5 as t3,
    p2.t1 - p0.t4 as t4,
    p0.t2 * 0.5 + p1.s3 * 0.5 as t5,
    p0.t4 as t6
from {{ ref('cust_0315') }} as p0
left join {{ ref('cust_0151') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0178') }} as p2 on p2.customer_id = p0.customer_id
