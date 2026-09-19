select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    case when p1.t3 > p0.s4 then p1.t3 else p0.s4 end as t2,
    p0.s4 + p1.t2 as t3,
    p0.s5 as t4
from {{ ref('cust_0052') }} as p0
left join {{ ref('cust_0133') }} as p1 on p1.customer_id = p0.customer_id
