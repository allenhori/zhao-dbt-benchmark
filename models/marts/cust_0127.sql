select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p0.t4 as t2,
    p1.s5 as t3,
    p0.t4 as t4
from {{ ref('cust_0035') }} as p0
left join {{ ref('cust_0012') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0091') }} as p2 on p2.customer_id = p0.customer_id
