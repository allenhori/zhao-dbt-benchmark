select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t1 as t1,
    case when p2.t2 > p1.s1 then p2.t2 else p1.s1 end as t2,
    p2.t2 as t3,
    p0.t5 as t4,
    case when p0.t5 > p2.t1 then p0.t5 else p2.t1 end as t5,
    p2.t2 + p1.s6 as t6
from {{ ref('cust_0092') }} as p0
left join {{ ref('cust_0126') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0168') }} as p2 on p2.customer_id = p0.customer_id
