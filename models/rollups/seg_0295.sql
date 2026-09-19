select
    p.segment_id as segment_id,
    sum(p.s2) as g1,
    avg(p.s6) as g2,
    sum(p.s6) as g3
from {{ ref('cust_0142') }} as p
group by p.segment_id
