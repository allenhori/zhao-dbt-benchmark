select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t2 as t1,
    p0.t1 as t2,
    case when p1.t4 > p0.t2 then p1.t4 else p0.t2 end as t3,
    p1.t6 - p0.t2 as t4,
    p0.t2 as t5
from {{ ref('cust_0322') }} as p0
left join {{ ref('cust_0529') }} as p1 on p1.customer_id = p0.customer_id
