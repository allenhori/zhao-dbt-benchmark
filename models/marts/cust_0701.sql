select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s2 as t1,
    p0.s1 as t2,
    p0.s5 as t3,
    case when p0.s1 > p1.s2 then p0.s1 else p1.s2 end as t4,
    p1.s5 as t5,
    p0.s1 + p1.s2 as t6
from {{ ref('cust_0417') }} as p0
left join {{ ref('cust_0251') }} as p1 on p1.customer_id = p0.customer_id
