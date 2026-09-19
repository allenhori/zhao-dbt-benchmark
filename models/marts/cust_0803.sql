select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 as t1,
    p1.t3 + p2.t4 as t2,
    case when p0.t1 > p1.t3 then p0.t1 else p1.t3 end as t3,
    p0.t6 * 0.5 + p2.t1 * 0.5 as t4,
    p2.t1 - p1.t4 as t5
from {{ ref('cust_0782') }} as p0
left join {{ ref('cust_0410') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0649') }} as p2 on p2.customer_id = p0.customer_id
