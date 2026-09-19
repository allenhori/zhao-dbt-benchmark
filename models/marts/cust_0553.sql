select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 as t1,
    case when p1.t4 > p0.s4 then p1.t4 else p0.s4 end as t2,
    case when p0.s4 > p1.t3 then p0.s4 else p1.t3 end as t3,
    p1.t4 as t4,
    p0.s4 as t5,
    p1.t4 as t6
from {{ ref('cust_0451') }} as p0
left join {{ ref('cust_0050') }} as p1 on p1.customer_id = p0.customer_id
