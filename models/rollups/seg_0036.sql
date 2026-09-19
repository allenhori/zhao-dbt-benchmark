select
    p.segment_id as segment_id,
    avg(p.t1) as g1,
    max(p.t2) as g2,
    max(p.t2) as g3,
    avg(p.t1) as g4
from {{ ref('cust_0748') }} as p
group by p.segment_id
