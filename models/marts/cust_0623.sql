select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s5 * 0.5 + p1.s1 * 0.5 as t1,
    p0.s5 + p1.s4 as t2,
    p0.s3 + p1.s1 as t3,
    p0.s5 as t4,
    p1.s1 as t5,
    p1.s4 as t6
from {{ ref('cust_0502') }} as p0
left join {{ ref('cust_0304') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0098') }} as p2 on p2.customer_id = p0.customer_id
