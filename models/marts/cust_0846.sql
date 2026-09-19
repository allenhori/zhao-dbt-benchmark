select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.t4 > p0.t2 then p1.t4 else p0.t2 end as t1,
    p0.t4 - p1.t4 as t2,
    p1.t2 as t3,
    p1.t2 as t4
from {{ ref('cust_0690') }} as p0
left join {{ ref('cust_0468') }} as p1 on p1.customer_id = p0.customer_id
