select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 + p0.t4 as t1,
    p1.t2 as t2,
    p1.t3 as t3,
    p0.t2 as t4,
    p1.t2 - p0.t2 as t5,
    p0.t4 as t6
from {{ ref('cust_0313') }} as p0
left join {{ ref('cust_0144') }} as p1 on p1.customer_id = p0.customer_id
