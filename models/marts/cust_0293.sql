select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s4 as t1,
    p1.t4 as t2,
    p2.t2 as t3,
    case when p0.s1 > p1.t6 then p0.s1 else p1.t6 end as t4
from {{ ref('cust_0208') }} as p0
left join {{ ref('cust_0017') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0257') }} as p2 on p2.customer_id = p0.customer_id
