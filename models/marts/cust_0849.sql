select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s5 as t1,
    p2.s5 as t2,
    case when p2.s4 > p0.s4 then p2.s4 else p0.s4 end as t3,
    p1.t4 as t4,
    case when p2.s4 > p1.t3 then p2.s4 else p1.t3 end as t5
from {{ ref('cust_0404') }} as p0
left join {{ ref('cust_0399') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0824') }} as p2 on p2.customer_id = p0.customer_id
