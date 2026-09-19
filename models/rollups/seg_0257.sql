select
    p.segment_id as segment_id,
    sum(p.t1) as g1,
    avg(p.t1) as g2,
    avg(p.t1) as g3,
    sum(p.t3) as g4
from {{ ref('cust_0814') }} as p
group by p.segment_id
