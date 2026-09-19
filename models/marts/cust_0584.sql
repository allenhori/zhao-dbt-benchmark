select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.t3 > p0.s1 then p1.t3 else p0.s1 end as t1,
    p0.s4 as t2,
    p1.t4 - p0.s4 as t3,
    p0.s1 + p1.t4 as t4,
    p0.s1 - p1.t3 as t5
from {{ ref('cust_0508') }} as p0
left join {{ ref('cust_0127') }} as p1 on p1.customer_id = p0.customer_id
