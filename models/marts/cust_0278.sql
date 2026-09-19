select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t4 > p1.t4 then p0.t4 else p1.t4 end as t1,
    p0.t4 + p1.t4 as t2,
    p0.t5 as t3,
    p0.t5 - p1.t5 as t4
from {{ ref('cust_0092') }} as p0
left join {{ ref('cust_0071') }} as p1 on p1.customer_id = p0.customer_id
