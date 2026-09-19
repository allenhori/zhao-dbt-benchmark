select
    p.segment_id as segment_id,
    avg(p.s5) as g1,
    avg(p.s2) as g2,
    max(p.s2) as g3
from {{ ref('cust_0783') }} as p
group by p.segment_id
