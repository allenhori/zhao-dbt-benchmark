select
    p.segment_id as segment_id,
    sum(p.t3) as g1,
    max(p.t3) as g2,
    avg(p.t5) as g3,
    sum(p.t3) as g4
from {{ ref('cust_0729') }} as p
group by p.segment_id
