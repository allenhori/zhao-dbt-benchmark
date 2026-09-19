select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t5 as t1,
    p0.t3 as t2,
    p0.t5 as t3,
    p0.t5 as t4,
    p0.t5 as t5
from {{ ref('cust_0204') }} as p0
