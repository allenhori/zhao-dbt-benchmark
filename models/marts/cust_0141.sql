select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s3 + p0.t6 as t1,
    case when p2.s3 > p1.s5 then p2.s3 else p1.s5 end as t2,
    p2.s1 - p1.s5 as t3,
    p2.s3 * 0.5 + p1.s4 * 0.5 as t4
from {{ ref('cust_0107') }} as p0
left join {{ ref('cust_0126') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0034') }} as p2 on p2.customer_id = p0.customer_id
