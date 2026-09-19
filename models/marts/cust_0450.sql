select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 as t1,
    p2.t2 * 0.5 + p1.s5 * 0.5 as t2,
    p1.s5 - p2.t4 as t3,
    case when p1.s3 > p0.s2 then p1.s3 else p0.s2 end as t4
from {{ ref('cust_0156') }} as p0
left join {{ ref('cust_0223') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0216') }} as p2 on p2.customer_id = p0.customer_id
