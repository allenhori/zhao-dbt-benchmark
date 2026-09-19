select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 as t1,
    case when p1.t3 > p0.t6 then p1.t3 else p0.t6 end as t2,
    p1.t1 * 0.5 + p0.t3 * 0.5 as t3,
    p1.t1 as t4
from {{ ref('cust_0103') }} as p0
left join {{ ref('cust_0545') }} as p1 on p1.customer_id = p0.customer_id
