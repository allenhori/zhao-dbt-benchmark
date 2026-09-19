select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.t3 as t1,
    p1.s5 as t2,
    p0.t3 * 0.5 + p1.s3 * 0.5 as t3,
    p1.s5 as t4,
    p1.s3 as t5,
    case when p1.s5 > p0.t3 then p1.s5 else p0.t3 end as t6
from {{ ref('cust_0299') }} as p0
left join {{ ref('cust_0115') }} as p1 on p1.customer_id = p0.customer_id
