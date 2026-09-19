select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 - p0.t3 as t1,
    p1.t1 as t2,
    case when p0.t1 > p1.t4 then p0.t1 else p1.t4 end as t3,
    p0.t3 - p1.t1 as t4,
    p1.t4 as t5,
    case when p0.t1 > p1.t1 then p0.t1 else p1.t1 end as t6
from {{ ref('cust_0537') }} as p0
left join {{ ref('cust_0791') }} as p1 on p1.customer_id = p0.customer_id
