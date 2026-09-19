select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s5 as t1,
    p1.t3 as t2,
    p1.t4 - p2.t1 as t3,
    p0.s5 as t4,
    p1.t3 - p0.s4 as t5
from {{ ref('cust_0323') }} as p0
left join {{ ref('cust_0849') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0313') }} as p2 on p2.customer_id = p0.customer_id
