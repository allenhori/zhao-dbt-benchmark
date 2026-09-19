select
    p.segment_id as segment_id,
    max(p.t2) as g1,
    avg(p.t2) as g2,
    avg(p.t2) as g3,
    avg(p.t1) as g4
from {{ ref('cust_0133') }} as p
group by p.segment_id
