select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t2 as t1,
    p0.t3 as t2,
    p2.t4 as t3,
    case when p1.s5 > p2.t3 then p1.s5 else p2.t3 end as t4,
    p0.t2 as t5
from {{ ref('cust_0011') }} as p0
left join {{ ref('cust_0005') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0231') }} as p2 on p2.customer_id = p0.customer_id
