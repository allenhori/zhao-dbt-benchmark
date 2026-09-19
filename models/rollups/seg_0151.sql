select
    p.segment_id as segment_id,
    avg(p.t5) as g1,
    sum(p.t4) as g2,
    sum(p.t5) as g3,
    max(p.t4) as g4
from {{ ref('cust_0241') }} as p
group by p.segment_id
