select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 - p1.t6 as t1,
    p1.t4 as t2,
    p1.t4 as t3,
    p1.t6 as t4,
    case when p1.t4 > p0.s5 then p1.t4 else p0.s5 end as t5
from {{ ref('cust_0195') }} as p0
left join {{ ref('cust_0191') }} as p1 on p1.customer_id = p0.customer_id
