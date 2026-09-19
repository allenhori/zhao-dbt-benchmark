select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    case when p1.t6 > p0.t5 then p1.t6 else p0.t5 end as t2,
    p1.t2 + p0.t1 as t3,
    p1.t2 as t4,
    p1.t2 as t5
from {{ ref('cust_0338') }} as p0
left join {{ ref('cust_0114') }} as p1 on p1.customer_id = p0.customer_id
