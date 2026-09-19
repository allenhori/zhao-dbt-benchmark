select
    p.segment_id as segment_id,
    avg(p.t4) as g1,
    max(p.t4) as g2,
    sum(p.t5) as g3,
    avg(p.t5) as g4
from {{ ref('cust_0695') }} as p
group by p.segment_id
