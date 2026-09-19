select
    p.segment_id as segment_id,
    avg(p.t5) as g1,
    avg(p.t4) as g2,
    avg(p.t5) as g3,
    max(p.t5) as g4
from {{ ref('cust_0247') }} as p
group by p.segment_id
