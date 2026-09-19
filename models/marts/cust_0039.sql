select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t5 as t1,
    p0.t5 as t2,
    p0.t4 as t3,
    p0.t4 as t4
from {{ ref('cust_0023') }} as p0
