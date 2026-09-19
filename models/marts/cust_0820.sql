select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 as t1,
    p0.s3 as t2,
    p0.s3 as t3,
    p1.s5 - p0.s5 as t4,
    p0.s3 - p1.s3 as t5,
    case when p0.s5 > p1.s5 then p0.s5 else p1.s5 end as t6
from {{ ref('cust_0265') }} as p0
left join {{ ref('cust_0432') }} as p1 on p1.customer_id = p0.customer_id
