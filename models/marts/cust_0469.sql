select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.t6 > p0.t1 then p1.t6 else p0.t1 end as t1,
    p1.t1 + p0.t1 as t2,
    p0.t2 as t3,
    p0.t2 as t4
from {{ ref('cust_0009') }} as p0
left join {{ ref('cust_0192') }} as p1 on p1.customer_id = p0.customer_id
