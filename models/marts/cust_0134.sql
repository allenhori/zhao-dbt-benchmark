select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t6 - p1.t6 as t1,
    p2.s5 as t2,
    p1.t3 as t3,
    p1.t3 as t4,
    case when p2.s5 > p1.t6 then p2.s5 else p1.t6 end as t5
from {{ ref('cust_0063') }} as p0
left join {{ ref('cust_0056') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0013') }} as p2 on p2.customer_id = p0.customer_id
