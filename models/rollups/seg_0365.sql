select
    p.segment_id as segment_id,
    max(p.s2) as g1,
    sum(p.s2) as g2,
    max(p.s2) as g3
from {{ ref('cust_0760') }} as p
group by p.segment_id
