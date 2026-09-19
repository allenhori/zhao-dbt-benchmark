select
    p.segment_id as segment_id,
    sum(p.t2) as g1,
    max(p.t3) as g2,
    max(p.t3) as g3,
    sum(p.t3) as g4
from {{ ref('cust_0541') }} as p
group by p.segment_id
