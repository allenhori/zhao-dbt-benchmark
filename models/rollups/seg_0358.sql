select
    p.segment_id as segment_id,
    max(p.t3) as g1,
    sum(p.t4) as g2,
    avg(p.t3) as g3,
    sum(p.t4) as g4
from {{ ref('cust_0455') }} as p
group by p.segment_id
