select
    p.segment_id as segment_id,
    max(p.t4) as g1,
    sum(p.t4) as g2,
    avg(p.t1) as g3,
    avg(p.t1) as g4
from {{ ref('cust_0595') }} as p
group by p.segment_id
