select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t1 * 0.5 + p1.t5 * 0.5 as t1,
    p2.t3 + p0.s6 as t2,
    case when p1.t5 > p2.t1 then p1.t5 else p2.t1 end as t3,
    case when p0.s2 > p1.t5 then p0.s2 else p1.t5 end as t4,
    p2.t3 as t5,
    p2.t3 as t6
from {{ ref('cust_0003') }} as p0
left join {{ ref('cust_0161') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0252') }} as p2 on p2.customer_id = p0.customer_id
