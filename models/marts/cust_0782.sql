select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t2 as t1,
    p1.t3 as t2,
    p0.t5 as t3,
    p1.t3 * 0.5 + p0.t2 * 0.5 as t4,
    case when p1.t1 > p0.t5 then p1.t1 else p0.t5 end as t5,
    p1.t1 as t6
from {{ ref('cust_0756') }} as p0
left join {{ ref('cust_0017') }} as p1 on p1.customer_id = p0.customer_id
