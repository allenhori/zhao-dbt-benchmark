select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s5 as t1,
    p1.t1 as t2,
    p0.s2 as t3,
    p2.t4 as t4
from {{ ref('cust_0689') }} as p0
left join {{ ref('cust_0650') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0486') }} as p2 on p2.customer_id = p0.customer_id
