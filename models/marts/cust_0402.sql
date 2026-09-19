select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 as t1,
    p1.t4 as t2,
    case when p2.t3 > p0.t4 then p2.t3 else p0.t4 end as t3,
    p0.t2 as t4
from {{ ref('cust_0157') }} as p0
left join {{ ref('cust_0204') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0294') }} as p2 on p2.customer_id = p0.customer_id
