select
    p0.customer_id as customer_id,
    p0.segment_id as segment_id,
    p1.s1 + p0.t3 as t1,
    p0.t3 as t2,
    p0.t4 * 0.5 + p1.s1 * 0.5 as t3,
    p1.s4 as t4,
    p0.t3 as t5
from {{ ref('cust_0427') }} as p0
left join {{ ref('cust_0208') }} as p1 on p1.customer_id = p0.customer_id
