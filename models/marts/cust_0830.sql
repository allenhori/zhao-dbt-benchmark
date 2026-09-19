select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.t4 > p0.s1 then p1.t4 else p0.s1 end as t1,
    p1.t2 - p0.s3 as t2,
    p0.s1 * 0.5 + p1.t4 * 0.5 as t3,
    p0.s1 as t4,
    p1.t2 + p0.s1 as t5
from {{ ref('cust_0443') }} as p0
left join {{ ref('cust_0722') }} as p1 on p1.customer_id = p0.customer_id
