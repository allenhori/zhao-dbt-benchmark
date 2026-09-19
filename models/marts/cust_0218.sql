select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 as t1,
    case when p1.t5 > p0.t4 then p1.t5 else p0.t4 end as t2,
    p0.t4 * 0.5 + p1.t5 * 0.5 as t3,
    p0.t4 as t4,
    p1.t1 - p0.t4 as t5,
    p0.t4 as t6
from {{ ref('cust_0180') }} as p0
left join {{ ref('cust_0080') }} as p1 on p1.customer_id = p0.customer_id
