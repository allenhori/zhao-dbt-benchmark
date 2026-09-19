select
    p.segment_id as segment_id,
    sum(p.s2) as g1,
    sum(p.s2) as g2,
    max(p.s6) as g3,
    max(p.s2) as g4
from {{ ref('cust_0036') }} as p
group by p.segment_id
