select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s2 > p0.t1 then p1.s2 else p0.t1 end as t1,
    p0.t1 as t2,
    p0.t1 - p1.s2 as t3,
    case when p0.t3 > p1.s1 then p0.t3 else p1.s1 end as t4,
    case when p1.s2 > p0.t1 then p1.s2 else p0.t1 end as t5,
    p1.s1 as t6
from {{ ref('cust_0039') }} as p0
left join {{ ref('cust_0334') }} as p1 on p1.customer_id = p0.customer_id
