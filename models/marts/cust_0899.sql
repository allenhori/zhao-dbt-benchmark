select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p2.t4 as t1,
    p0.s4 as t2,
    p0.s3 as t3,
    p2.t4 as t4,
    p0.s3 as t5,
    p0.s3 as t6
from {{ ref('cust_0562') }} as p0
left join {{ ref('cust_0898') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0660') }} as p2 on p2.customer_id = p0.customer_id
