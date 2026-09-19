select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p0.s3 > p2.t4 then p0.s3 else p2.t4 end as t1,
    p1.t5 as t2,
    p1.t2 as t3,
    p1.t2 as t4
from {{ ref('cust_0042') }} as p0
left join {{ ref('cust_0256') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0074') }} as p2 on p2.customer_id = p0.customer_id
