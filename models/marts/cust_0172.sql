select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t4 * 0.5 + p1.a1 * 0.5 as t1,
    p1.a1 as t2,
    p0.t1 - p1.a1 as t3,
    p0.t1 + p1.a1 as t4,
    p0.t1 + p1.a3 as t5,
    p0.t1 - p1.a3 as t6
from {{ ref('cust_0141') }} as p0
left join {{ ref('stg_cu_1') }} as p1 on p1.customer_id = p0.customer_id
