select
    p.segment_id as segment_id,
    avg(p.s2) as g1,
    avg(p.s4) as g2,
    max(p.s2) as g3,
    max(p.s2) as g4
from {{ ref('cust_0603') }} as p
group by p.segment_id
