select
    p.segment_id as segment_id,
    avg(p.s2) as g1,
    max(p.s2) as g2,
    max(p.s4) as g3,
    max(p.s4) as g4
from {{ ref('cust_0826') }} as p
group by p.segment_id
