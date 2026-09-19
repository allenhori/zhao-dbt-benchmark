select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 as t1,
    p0.t5 + p1.t5 as t2,
    case when p0.t5 > p1.t1 then p0.t5 else p1.t1 end as t3,
    p0.t5 as t4,
    p1.t1 + p0.t5 as t5,
    p1.t5 * 0.5 + p0.t1 * 0.5 as t6
from {{ ref('cust_0100') }} as p0
left join {{ ref('cust_0225') }} as p1 on p1.customer_id = p0.customer_id
