select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.s3 > p2.t5 then p0.s3 else p2.t5 end as t1,
    p1.s1 + p0.s3 as t2,
    case when p1.s4 > p0.s2 then p1.s4 else p0.s2 end as t3,
    p2.t6 as t4
from {{ ref('cust_0184') }} as p0
left join {{ ref('cust_0014') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0116') }} as p2 on p2.customer_id = p0.customer_id
