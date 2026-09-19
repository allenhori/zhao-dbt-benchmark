select
    p.segment_id as segment_id,
    max(p.t4) as g1,
    max(p.t2) as g2,
    sum(p.t4) as g3,
    avg(p.t2) as g4
from {{ ref('cust_0479') }} as p
group by p.segment_id
