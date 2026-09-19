select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 as t1,
    p1.t2 + p0.t1 as t2,
    case when p0.t1 > p1.t2 then p0.t1 else p1.t2 end as t3,
    p1.t3 * 0.5 + p0.t5 * 0.5 as t4,
    p1.t3 as t5,
    p0.t5 as t6
from {{ ref('cust_0581') }} as p0
left join {{ ref('cust_0321') }} as p1 on p1.customer_id = p0.customer_id
