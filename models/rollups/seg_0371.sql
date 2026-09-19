select
    p.segment_id as segment_id,
    max(p.t4) as g1,
    max(p.t4) as g2,
    sum(p.t2) as g3
from {{ ref('cust_0170') }} as p
group by p.segment_id
