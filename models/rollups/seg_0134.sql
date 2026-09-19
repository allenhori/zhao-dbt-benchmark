select
    p.segment_id as segment_id,
    sum(p.t5) as g1,
    sum(p.t5) as g2,
    avg(p.t5) as g3,
    sum(p.t5) as g4
from {{ ref('cust_0534') }} as p
group by p.segment_id
