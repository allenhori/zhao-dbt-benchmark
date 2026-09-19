select
    p.segment_id as segment_id,
    max(p.t3) as g1,
    max(p.t3) as g2,
    sum(p.t5) as g3
from {{ ref('cust_0072') }} as p
group by p.segment_id
