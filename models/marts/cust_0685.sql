select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s5 as t1,
    p0.t5 as t2,
    p0.t6 as t3,
    case when p1.s6 > p0.t5 then p1.s6 else p0.t5 end as t4,
    p0.t5 * 0.5 + p1.s5 * 0.5 as t5
from {{ ref('cust_0673') }} as p0
left join {{ ref('cust_0646') }} as p1 on p1.customer_id = p0.customer_id
