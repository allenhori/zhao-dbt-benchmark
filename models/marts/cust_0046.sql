select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.a4 + p1.t1 as t1,
    p1.t1 as t2,
    p0.a4 as t3,
    case when p0.a5 > p1.t1 then p0.a5 else p1.t1 end as t4
from {{ ref('stg_cu_2') }} as p0
left join {{ ref('cust_0020') }} as p1 on p1.customer_id = p0.customer_id
