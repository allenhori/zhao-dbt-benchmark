select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    p1.s5 as t2,
    p2.t3 as t3,
    p1.s5 * 0.5 + p2.t3 * 0.5 as t4,
    case when p1.s1 > p2.t5 then p1.s1 else p2.t5 end as t5
from {{ ref('cust_0661') }} as p0
left join {{ ref('cust_0544') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0652') }} as p2 on p2.customer_id = p0.customer_id
