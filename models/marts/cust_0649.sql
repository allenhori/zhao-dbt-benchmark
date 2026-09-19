select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s1 as t1,
    p0.s6 - p1.s4 as t2,
    p1.s4 as t3,
    case when p1.s4 > p0.s6 then p1.s4 else p0.s6 end as t4
from {{ ref('cust_0240') }} as p0
left join {{ ref('cust_0544') }} as p1 on p1.customer_id = p0.customer_id
