select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.a5 as t1,
    p1.a4 as t2,
    p1.a4 * 0.5 + p0.s4 * 0.5 as t3,
    p1.a5 as t4
from {{ ref('cust_0003') }} as p0
left join {{ ref('stg_cu_2') }} as p1 on p1.customer_id = p0.customer_id
