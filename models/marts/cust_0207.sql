select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t3 as t1,
    p2.t2 as t2,
    p1.t3 + p2.t6 as t3,
    p1.t4 as t4
from {{ ref('cust_0037') }} as p0
left join {{ ref('cust_0205') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0170') }} as p2 on p2.customer_id = p0.customer_id
