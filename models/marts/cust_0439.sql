select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s1 > p0.t1 then p1.s1 else p0.t1 end as t1,
    p1.s4 as t2,
    p0.t4 as t3,
    p1.s4 as t4
from {{ ref('cust_0241') }} as p0
left join {{ ref('cust_0067') }} as p1 on p1.customer_id = p0.customer_id
