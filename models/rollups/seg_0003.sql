select
    p.segment_id as segment_id,
    avg(p.t3) as g1,
    avg(p.t4) as g2,
    sum(p.t3) as g3,
    max(p.t3) as g4
from {{ ref('cust_0343') }} as p
group by p.segment_id
