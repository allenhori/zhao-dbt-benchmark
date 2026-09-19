select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.t2 > p1.s4 then p0.t2 else p1.s4 end as t1,
    p0.t1 * 0.5 + p1.s4 * 0.5 as t2,
    p0.t1 as t3,
    p1.s3 as t4,
    case when p1.s4 > p0.t1 then p1.s4 else p0.t1 end as t5,
    p1.s3 as t6
from {{ ref('cust_0193') }} as p0
left join {{ ref('cust_0037') }} as p1 on p1.customer_id = p0.customer_id
