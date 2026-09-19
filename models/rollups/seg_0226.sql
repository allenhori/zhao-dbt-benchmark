select
    p.segment_id as segment_id,
    max(p.t6) as g1,
    max(p.t6) as g2,
    avg(p.t4) as g3,
    max(p.t4) as g4
from {{ ref('cust_0310') }} as p
group by p.segment_id
