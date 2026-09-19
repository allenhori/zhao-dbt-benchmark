select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    p0.t4 - p1.t2 as t2,
    case when p1.t2 > p0.t4 then p1.t2 else p0.t4 end as t3,
    p0.t4 as t4
from {{ ref('cust_0155') }} as p0
left join {{ ref('cust_0181') }} as p1 on p1.customer_id = p0.customer_id
