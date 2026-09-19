select
    p.segment_id as segment_id,
    avg(p.t1) as g1,
    avg(p.t2) as g2,
    avg(p.t1) as g3,
    sum(p.t1) as g4
from {{ ref('cust_0668') }} as p
group by p.segment_id
