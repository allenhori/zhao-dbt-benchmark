select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 * 0.5 + p2.s4 * 0.5 as t1,
    p1.t3 + p0.t2 as t2,
    p2.s3 * 0.5 + p1.t3 * 0.5 as t3,
    p2.s4 as t4,
    case when p0.t2 > p1.t5 then p0.t2 else p1.t5 end as t5
from {{ ref('cust_0586') }} as p0
left join {{ ref('cust_0555') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0577') }} as p2 on p2.customer_id = p0.customer_id
