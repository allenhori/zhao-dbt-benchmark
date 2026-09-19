select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    p1.t1 * 0.5 + p0.t2 * 0.5 as t2,
    case when p1.t3 > p0.t2 then p1.t3 else p0.t2 end as t3,
    p0.t2 * 0.5 + p1.t3 * 0.5 as t4,
    p0.t1 * 0.5 + p1.t1 * 0.5 as t5,
    p0.t2 * 0.5 + p1.t1 * 0.5 as t6
from {{ ref('cust_0253') }} as p0
left join {{ ref('cust_0044') }} as p1 on p1.customer_id = p0.customer_id
