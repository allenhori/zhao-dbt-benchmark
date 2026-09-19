select
    p.segment_id as segment_id,
    max(p.s4) as g1,
    avg(p.s1) as g2,
    avg(p.s1) as g3,
    avg(p.s1) as g4
from {{ ref('cust_0217') }} as p
group by p.segment_id
