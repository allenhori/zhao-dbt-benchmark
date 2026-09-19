select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s4 > p0.s3 then p1.s4 else p0.s3 end as t1,
    p1.s3 as t2,
    p0.s3 as t3,
    p0.s3 + p1.s4 as t4,
    p1.s3 as t5
from {{ ref('cust_0125') }} as p0
left join {{ ref('cust_0104') }} as p1 on p1.customer_id = p0.customer_id
