select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p0.t3 as t2,
    p0.t4 as t3,
    p1.s3 as t4,
    p1.s3 as t5
from {{ ref('cust_0260') }} as p0
left join {{ ref('cust_0334') }} as p1 on p1.customer_id = p0.customer_id
