select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t4 * 0.5 + p0.t1 * 0.5 as t1,
    case when p0.t2 > p1.t4 then p0.t2 else p1.t4 end as t2,
    p1.t3 + p0.t2 as t3,
    case when p1.t3 > p0.t2 then p1.t3 else p0.t2 end as t4
from {{ ref('cust_0044') }} as p0
left join {{ ref('cust_0213') }} as p1 on p1.customer_id = p0.customer_id
