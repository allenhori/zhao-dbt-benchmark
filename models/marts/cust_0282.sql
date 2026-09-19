select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s4 > p0.s1 then p1.s4 else p0.s1 end as t1,
    p1.s4 * 0.5 + p0.s1 * 0.5 as t2,
    case when p1.s5 > p0.s1 then p1.s5 else p0.s1 end as t3,
    p1.s5 * 0.5 + p0.s3 * 0.5 as t4
from {{ ref('cust_0153') }} as p0
left join {{ ref('cust_0122') }} as p1 on p1.customer_id = p0.customer_id
