select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p1.t2 * 0.5 + p0.t3 * 0.5 as t2,
    case when p2.t1 > p0.t4 then p2.t1 else p0.t4 end as t3,
    p2.t2 as t4,
    p2.t2 as t5,
    p0.t4 - p2.t2 as t6
from {{ ref('cust_0351') }} as p0
left join {{ ref('cust_0077') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0110') }} as p2 on p2.customer_id = p0.customer_id
