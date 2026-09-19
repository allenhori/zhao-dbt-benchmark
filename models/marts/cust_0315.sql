select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t1 as t1,
    p0.t1 as t2,
    p0.t1 as t3,
    p0.t1 as t4,
    p0.t1 as t5
from {{ ref('cust_0018') }} as p0
