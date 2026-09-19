select
    p.segment_id as segment_id,
    avg(p.s2) as g1,
    max(p.s4) as g2,
    avg(p.s2) as g3,
    avg(p.s2) as g4
from {{ ref('cust_0012') }} as p
group by p.segment_id
