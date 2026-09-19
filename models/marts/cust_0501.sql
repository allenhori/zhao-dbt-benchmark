select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 as t1,
    p1.t4 as t2,
    p0.s1 as t3,
    case when p2.t4 > p1.t1 then p2.t4 else p1.t1 end as t4,
    p2.t4 as t5
from {{ ref('cust_0190') }} as p0
left join {{ ref('cust_0021') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0096') }} as p2 on p2.customer_id = p0.customer_id
