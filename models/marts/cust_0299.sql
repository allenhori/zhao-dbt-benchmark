select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a5 as t1,
    p0.a5 as t2,
    p0.a5 as t3,
    p0.a5 as t4,
    p0.a5 as t5,
    p0.a5 as t6
from {{ ref('stg_cu_2') }} as p0
