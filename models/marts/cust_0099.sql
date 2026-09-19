select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s3 - p1.s3 as t1,
    case when p1.s3 > p0.s4 then p1.s3 else p0.s4 end as t2,
    p0.s3 * 0.5 + p1.s4 * 0.5 as t3,
    p0.s4 as t4
from {{ ref('cust_0042') }} as p0
left join {{ ref('cust_0045') }} as p1 on p1.customer_id = p0.customer_id
