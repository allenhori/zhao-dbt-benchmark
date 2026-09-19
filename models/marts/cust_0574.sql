select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t1 as t1,
    p1.t3 * 0.5 + p0.t3 * 0.5 as t2,
    p0.t2 as t3,
    p1.t3 as t4,
    p0.t2 as t5,
    case when p0.t2 > p1.t1 then p0.t2 else p1.t1 end as t6
from {{ ref('cust_0434') }} as p0
left join {{ ref('cust_0216') }} as p1 on p1.customer_id = p0.customer_id
