select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s4 as t1,
    p1.s5 + p0.s4 as t2,
    p0.s2 + p1.s5 as t3,
    case when p0.s4 > p1.s2 then p0.s4 else p1.s2 end as t4
from {{ ref('cust_0007') }} as p0
left join {{ ref('cust_0022') }} as p1 on p1.customer_id = p0.customer_id
