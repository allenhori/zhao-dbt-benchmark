select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.s2 > p1.t2 then p0.s2 else p1.t2 end as t1,
    p2.t4 + p1.t5 as t2,
    p2.t4 as t3,
    p0.s4 * 0.5 + p1.t2 * 0.5 as t4
from {{ ref('cust_0131') }} as p0
left join {{ ref('cust_0186') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0033') }} as p2 on p2.customer_id = p0.customer_id
