select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 * 0.5 + p1.t4 * 0.5 as t1,
    p1.t4 as t2,
    p0.t3 - p1.t4 as t3,
    case when p0.t2 > p1.t4 then p0.t2 else p1.t4 end as t4,
    p1.t4 * 0.5 + p0.t3 * 0.5 as t5
from {{ ref('cust_0301') }} as p0
left join {{ ref('cust_0540') }} as p1 on p1.customer_id = p0.customer_id
