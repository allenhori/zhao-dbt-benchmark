select
    p.segment_id as segment_id,
    max(p.s2) as g1,
    sum(p.s2) as g2,
    sum(p.s2) as g3,
    max(p.s1) as g4
from {{ ref('cust_0345') }} as p
group by p.segment_id
