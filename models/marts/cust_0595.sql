select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s6 as t1,
    p2.t4 as t2,
    p1.s2 as t3,
    case when p2.t3 > p1.s4 then p2.t3 else p1.s4 end as t4
from {{ ref('cust_0577') }} as p0
left join {{ ref('cust_0261') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0205') }} as p2 on p2.customer_id = p0.customer_id
