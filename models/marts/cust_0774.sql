select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t5 > p1.s1 then p0.t5 else p1.s1 end as t1,
    p1.s3 * 0.5 + p0.t5 * 0.5 as t2,
    p1.s3 as t3,
    p0.t4 - p2.t1 as t4
from {{ ref('cust_0359') }} as p0
left join {{ ref('cust_0005') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0023') }} as p2 on p2.customer_id = p0.customer_id
