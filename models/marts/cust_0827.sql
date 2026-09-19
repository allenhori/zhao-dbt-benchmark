select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    p0.t1 as t2,
    p1.t3 as t3,
    p1.t3 as t4,
    p0.t3 as t5,
    p2.t5 + p0.t1 as t6
from {{ ref('cust_0253') }} as p0
left join {{ ref('cust_0107') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0808') }} as p2 on p2.customer_id = p0.customer_id
