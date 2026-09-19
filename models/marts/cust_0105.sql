select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.s5 as t1,
    p0.t1 as t2,
    case when p1.t6 > p2.s5 then p1.t6 else p2.s5 end as t3,
    case when p2.s5 > p0.t4 then p2.s5 else p0.t4 end as t4,
    p2.s5 as t5,
    p2.s5 as t6
from {{ ref('cust_0074') }} as p0
left join {{ ref('cust_0103') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0012') }} as p2 on p2.customer_id = p0.customer_id
