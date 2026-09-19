select
    p.segment_id as segment_id,
    sum(p.t2) as g1,
    sum(p.t3) as g2,
    avg(p.t3) as g3,
    avg(p.t2) as g4
from {{ ref('cust_0668') }} as p
group by p.segment_id
