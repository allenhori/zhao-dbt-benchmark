select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 + p1.t2 as t1,
    p0.t4 - p1.t3 as t2,
    p1.t2 * 0.5 + p0.t5 * 0.5 as t3,
    case when p0.t5 > p1.t3 then p0.t5 else p1.t3 end as t4,
    p1.t3 as t5,
    p0.t5 as t6
from {{ ref('cust_0253') }} as p0
left join {{ ref('cust_0134') }} as p1 on p1.customer_id = p0.customer_id
