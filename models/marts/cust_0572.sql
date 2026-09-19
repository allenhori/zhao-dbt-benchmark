select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 - p1.s4 as t1,
    case when p0.s3 > p1.s5 then p0.s3 else p1.s5 end as t2,
    p0.s3 as t3,
    case when p0.s3 > p1.s5 then p0.s3 else p1.s5 end as t4,
    p1.s4 as t5,
    p1.s4 as t6
from {{ ref('cust_0146') }} as p0
left join {{ ref('cust_0013') }} as p1 on p1.customer_id = p0.customer_id
