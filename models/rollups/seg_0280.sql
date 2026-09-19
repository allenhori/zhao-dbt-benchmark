select
    p.segment_id as segment_id,
    avg(p.s2) as g1,
    avg(p.s2) as g2,
    max(p.s2) as g3,
    sum(p.s4) as g4
from {{ ref('cust_0706') }} as p
group by p.segment_id
