select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t5 as t1,
    p1.t1 as t2,
    p1.t1 as t3,
    p1.t1 - p0.t3 as t4,
    p1.t3 - p0.t3 as t5
from {{ ref('cust_0277') }} as p0
left join {{ ref('cust_0300') }} as p1 on p1.customer_id = p0.customer_id
