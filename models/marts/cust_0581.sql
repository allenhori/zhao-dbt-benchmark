select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t2 as t1,
    p1.s1 as t2,
    p0.t2 as t3,
    case when p0.t5 > p1.s1 then p0.t5 else p1.s1 end as t4,
    p1.s3 as t5
from {{ ref('cust_0228') }} as p0
left join {{ ref('cust_0389') }} as p1 on p1.customer_id = p0.customer_id
