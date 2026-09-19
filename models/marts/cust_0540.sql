select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s5 > p0.t4 then p1.s5 else p0.t4 end as t1,
    p0.t4 as t2,
    p1.s5 as t3,
    p0.t4 as t4,
    p1.s5 as t5,
    p0.t4 + p1.s1 as t6
from {{ ref('cust_0050') }} as p0
left join {{ ref('cust_0012') }} as p1 on p1.customer_id = p0.customer_id
