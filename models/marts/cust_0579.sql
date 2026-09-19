select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s1 - p1.t3 as t1,
    p1.t1 + p0.s5 as t2,
    p0.s1 as t3,
    p1.t1 as t4,
    p1.t3 as t5
from {{ ref('cust_0062') }} as p0
left join {{ ref('cust_0437') }} as p1 on p1.customer_id = p0.customer_id
