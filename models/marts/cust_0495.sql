select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s4 > p0.s1 then p1.s4 else p0.s1 end as t1,
    p2.s3 as t2,
    p0.s3 as t3,
    p1.s3 as t4,
    case when p2.s2 > p1.s3 then p2.s2 else p1.s3 end as t5,
    case when p0.s1 > p2.s2 then p0.s1 else p2.s2 end as t6
from {{ ref('cust_0089') }} as p0
left join {{ ref('cust_0480') }} as p1 on p1.customer_id = p0.customer_id
left join {{ ref('cust_0115') }} as p2 on p2.customer_id = p0.customer_id
