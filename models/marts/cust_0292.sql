select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t3 - p1.t1 as t1,
    p0.s4 - p1.t2 as t2,
    case when p2.t3 > p1.t2 then p2.t3 else p1.t2 end as t3,
    p0.s4 as t4,
    p0.s5 * 0.5 + p1.t2 * 0.5 as t5
from {{ ref('cust_0012') }} as p0
left join {{ ref('cust_0168') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0118') }} as p2 on p2.customer_id = p0.customer_id
