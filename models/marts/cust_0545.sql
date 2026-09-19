select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t4 > p1.t2 then p0.t4 else p1.t2 end as t1,
    p0.t2 - p1.t1 as t2,
    p0.t2 + p1.t1 as t3,
    p2.t6 - p0.t4 as t4,
    case when p2.t6 > p1.t1 then p2.t6 else p1.t1 end as t5
from {{ ref('cust_0288') }} as p0
left join {{ ref('cust_0310') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0494') }} as p2 on p2.customer_id = p0.customer_id
