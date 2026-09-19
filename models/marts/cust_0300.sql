select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.t2 as t1,
    p0.s3 as t2,
    p1.t2 - p0.s4 as t3,
    p0.s4 as t4
from {{ ref('cust_0101') }} as p0
left join {{ ref('cust_0294') }} as p1 on p1.customer_id = p0.customer_id
