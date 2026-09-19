select
    p.segment_id as segment_id,
    sum(p.t3) as g1,
    sum(p.t3) as g2,
    sum(p.t3) as g3,
    sum(p.t4) as g4
from {{ ref('cust_0185') }} as p
group by p.segment_id
