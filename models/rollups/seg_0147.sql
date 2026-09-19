select
    p.segment_id as segment_id,
    sum(p.t1) as g1,
    avg(p.t3) as g2,
    max(p.t3) as g3,
    avg(p.t1) as g4
from {{ ref('cust_0331') }} as p
group by p.segment_id
