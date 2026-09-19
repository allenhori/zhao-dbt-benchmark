select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 * 0.5 + p0.s6 * 0.5 as t1,
    case when p1.s5 > p0.s1 then p1.s5 else p0.s1 end as t2,
    p1.s5 * 0.5 + p0.s6 * 0.5 as t3,
    p1.s5 as t4,
    p1.s3 as t5
from {{ ref('cust_0544') }} as p0
left join {{ ref('cust_0610') }} as p1 on p1.customer_id = p0.customer_id
