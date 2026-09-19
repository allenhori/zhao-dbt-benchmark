select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s3 as t1,
    p2.s5 as t2,
    case when p0.s4 > p1.s5 then p0.s4 else p1.s5 end as t3,
    p2.s5 + p0.s4 as t4,
    p2.s5 * 0.5 + p1.s5 * 0.5 as t5,
    p0.s4 + p2.s3 as t6
from {{ ref('cust_0344') }} as p0
left join {{ ref('cust_0317') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0195') }} as p2 on p2.customer_id = p0.customer_id
