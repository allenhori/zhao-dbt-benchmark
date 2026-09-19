select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    case when p0.t2 > p1.s2 then p0.t2 else p1.s2 end as t2,
    p0.t3 as t3,
    p1.s5 - p0.t2 as t4,
    p1.s2 as t5,
    p1.s5 + p0.t3 as t6
from {{ ref('cust_0219') }} as p0
left join {{ ref('cust_0068') }} as p1 on p1.customer_id = p0.customer_id
