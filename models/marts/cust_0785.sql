select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p0.s5 as t1,
    p1.s3 as t2,
    p2.t2 as t3,
    case when p2.t1 > p1.s2 then p2.t1 else p1.s2 end as t4,
    case when p2.t1 > p1.s3 then p2.t1 else p1.s3 end as t5,
    p1.s2 as t6
from {{ ref('cust_0323') }} as p0
left join {{ ref('cust_0766') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0322') }} as p2 on p2.customer_id = p0.customer_id
