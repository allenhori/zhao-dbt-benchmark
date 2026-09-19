select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s1 as t1,
    p1.s1 as t2,
    case when p0.s1 > p1.s1 then p0.s1 else p1.s1 end as t3,
    p1.s2 as t4,
    p1.s2 as t5,
    p0.s4 as t6
from {{ ref('cust_0042') }} as p0
left join {{ ref('cust_0089') }} as p1 on p1.customer_id = p0.customer_id
