select
    p.segment_id as segment_id,
    avg(p.s6) as g1,
    avg(p.s6) as g2,
    max(p.s2) as g3
from {{ ref('cust_0250') }} as p
group by p.segment_id
