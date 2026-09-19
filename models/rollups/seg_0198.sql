select
    p.segment_id as segment_id,
    avg(p.t3) as g1,
    avg(p.t3) as g2,
    avg(p.t2) as g3,
    avg(p.t3) as g4
from {{ ref('cust_0351') }} as p
group by p.segment_id
