select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 as t1,
    case when p1.t1 > p0.t4 then p1.t1 else p0.t4 end as t2,
    p2.s4 as t3,
    p0.t2 as t4
from {{ ref('cust_0110') }} as p0
left join {{ ref('cust_0099') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0115') }} as p2 on p2.customer_id = p0.customer_id
