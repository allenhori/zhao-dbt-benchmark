select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s2 as t1,
    case when p0.t5 > p1.s5 then p0.t5 else p1.s5 end as t2,
    p0.t1 * 0.5 + p1.s5 * 0.5 as t3,
    p0.t1 * 0.5 + p1.s2 * 0.5 as t4,
    p1.s5 as t5,
    p0.t1 as t6
from {{ ref('cust_0393') }} as p0
left join {{ ref('cust_0601') }} as p1 on p1.customer_id = p0.customer_id
