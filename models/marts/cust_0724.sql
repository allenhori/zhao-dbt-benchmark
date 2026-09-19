select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    case when p0.t1 > p1.t4 then p0.t1 else p1.t4 end as t2,
    p1.t6 as t3,
    p1.t4 + p0.t2 as t4
from {{ ref('cust_0010') }} as p0
left join {{ ref('cust_0329') }} as p1 on p1.customer_id = p0.customer_id
