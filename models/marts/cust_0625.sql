select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 + p2.t3 as t1,
    case when p0.t1 > p2.t4 then p0.t1 else p2.t4 end as t2,
    p1.s1 as t3,
    p0.t1 as t4,
    p1.s2 as t5,
    p0.t4 as t6
from {{ ref('cust_0063') }} as p0
left join {{ ref('cust_0423') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0186') }} as p2 on p2.customer_id = p0.customer_id
