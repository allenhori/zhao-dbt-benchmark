select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s1 + p1.t3 as t1,
    p0.s1 - p1.t1 as t2,
    p1.t3 as t3,
    case when p0.s1 > p1.t3 then p0.s1 else p1.t3 end as t4,
    p0.s1 + p1.t3 as t5,
    p1.t3 - p0.s2 as t6
from {{ ref('cust_0179') }} as p0
left join {{ ref('cust_0113') }} as p1 on p1.customer_id = p0.customer_id
