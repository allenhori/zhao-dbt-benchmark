select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    p0.t2 as t2,
    p1.t5 as t3,
    case when p0.t4 > p1.t5 then p0.t4 else p1.t5 end as t4
from {{ ref('cust_0032') }} as p0
left join {{ ref('cust_0018') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0002') }} as p2 on p2.customer_id = p0.customer_id
