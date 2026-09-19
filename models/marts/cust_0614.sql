select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    case when p1.s5 > p0.s1 then p1.s5 else p0.s1 end as t1,
    case when p1.s5 > p0.s1 then p1.s5 else p0.s1 end as t2,
    p0.s3 as t3,
    p1.s2 as t4,
    p1.s2 + p0.s1 as t5,
    p1.s2 as t6
from {{ ref('cust_0435') }} as p0
left join {{ ref('cust_0215') }} as p1 on p1.customer_id = p0.customer_id
