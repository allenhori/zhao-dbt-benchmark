select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 as t1,
    p2.s4 as t2,
    p0.s2 as t3,
    p1.t1 * 0.5 + p0.s4 * 0.5 as t4,
    case when p2.s1 > p0.s4 then p2.s1 else p0.s4 end as t5
from {{ ref('cust_0087') }} as p0
left join {{ ref('cust_0065') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0089') }} as p2 on p2.customer_id = p0.customer_id
