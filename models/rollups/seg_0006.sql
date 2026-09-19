select
    p.segment_id as segment_id,
    max(p.s5) as g1,
    sum(p.s5) as g2,
    max(p.s5) as g3,
    max(p.s4) as g4
from {{ ref('cust_0108') }} as p
group by p.segment_id
