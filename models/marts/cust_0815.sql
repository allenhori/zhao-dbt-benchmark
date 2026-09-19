select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    p0.t3 * 0.5 + p1.t2 * 0.5 as t2,
    p0.t2 * 0.5 + p1.t2 * 0.5 as t3,
    case when p0.t3 > p1.t2 then p0.t3 else p1.t2 end as t4,
    p0.t3 as t5,
    p1.t6 + p0.t3 as t6
from {{ ref('cust_0772') }} as p0
left join {{ ref('cust_0620') }} as p1 on p1.customer_id = p0.customer_id
