select
    p.segment_id as segment_id,
    avg(p.t4) as g1,
    avg(p.t4) as g2,
    avg(p.t4) as g3,
    avg(p.t4) as g4
from {{ ref('cust_0086') }} as p
group by p.segment_id
