select
    p.segment_id as segment_id,
    max(p.s4) as g1,
    max(p.s4) as g2,
    max(p.s4) as g3,
    sum(p.s5) as g4
from {{ ref('cust_0319') }} as p
group by p.segment_id
