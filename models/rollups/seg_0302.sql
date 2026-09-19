select
    p.segment_id as segment_id,
    sum(p.s4) as g1,
    avg(p.s4) as g2,
    sum(p.s2) as g3,
    max(p.s4) as g4
from {{ ref('cust_0480') }} as p
group by p.segment_id
