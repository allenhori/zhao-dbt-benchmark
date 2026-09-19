select
    p.segment_id as segment_id,
    max(p.s1) as g1,
    avg(p.s1) as g2,
    avg(p.s4) as g3
from {{ ref('cust_0447') }} as p
group by p.segment_id
