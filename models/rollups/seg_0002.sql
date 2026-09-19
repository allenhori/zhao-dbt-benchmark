select
    p.segment_id as segment_id,
    sum(p.t5) as g1,
    max(p.t5) as g2,
    sum(p.t1) as g3,
    max(p.t1) as g4
from {{ ref('cust_0803') }} as p
group by p.segment_id
