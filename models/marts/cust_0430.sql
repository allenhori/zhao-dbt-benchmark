select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s1 - p2.t5 as t1,
    p1.s4 + p2.t5 as t2,
    p0.s3 as t3,
    p1.s4 as t4,
    case when p0.s3 > p1.s4 then p0.s3 else p1.s4 end as t5,
    p0.s3 as t6
from {{ ref('cust_0174') }} as p0
left join {{ ref('cust_0381') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0198') }} as p2 on p2.customer_id = p0.customer_id
