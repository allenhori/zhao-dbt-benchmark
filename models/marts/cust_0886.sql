select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 as t1,
    p1.t4 as t2,
    p1.t2 * 0.5 + p0.t4 * 0.5 as t3,
    case when p1.t4 > p0.t4 then p1.t4 else p0.t4 end as t4,
    p1.t4 + p0.t3 as t5,
    p0.t3 - p1.t2 as t6
from {{ ref('cust_0401') }} as p0
left join {{ ref('cust_0855') }} as p1 on p1.customer_id = p0.customer_id
