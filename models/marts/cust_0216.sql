select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s4 as t1,
    case when p1.s4 > p0.t2 then p1.s4 else p0.t2 end as t2,
    p0.t1 as t3,
    case when p1.s3 > p0.t1 then p1.s3 else p0.t1 end as t4
from {{ ref('cust_0127') }} as p0
left join {{ ref('cust_0022') }} as p1 on p1.customer_id = p0.customer_id
