select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.s6 > p2.t3 then p0.s6 else p2.t3 end as t1,
    p0.s1 * 0.5 + p2.t3 * 0.5 as t2,
    p0.s1 + p2.t1 as t3,
    p0.s1 as t4,
    p0.s6 as t5
from {{ ref('cust_0142') }} as p0
left join {{ ref('cust_0147') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0407') }} as p2 on p2.customer_id = p0.customer_id
