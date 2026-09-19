select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s3 as t1,
    p0.t4 as t2,
    case when p1.s3 > p0.t4 then p1.s3 else p0.t4 end as t3,
    p1.s2 as t4,
    p0.t1 as t5,
    p1.s2 as t6
from {{ ref('cust_0282') }} as p0
left join {{ ref('cust_0251') }} as p1 on p1.customer_id = p0.customer_id
