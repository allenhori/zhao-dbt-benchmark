select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t2 > p1.t4 then p0.t2 else p1.t4 end as t1,
    p0.t4 as t2,
    p1.t2 as t3,
    p2.t1 as t4
from {{ ref('cust_0804') }} as p0
left join {{ ref('cust_0368') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0366') }} as p2 on p2.customer_id = p0.customer_id
