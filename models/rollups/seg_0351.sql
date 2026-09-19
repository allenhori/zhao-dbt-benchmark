select
    p.segment_id as segment_id,
    avg(p.s2) as g1,
    avg(p.s2) as g2,
    sum(p.s4) as g3
from {{ ref('cust_0725') }} as p
group by p.segment_id
