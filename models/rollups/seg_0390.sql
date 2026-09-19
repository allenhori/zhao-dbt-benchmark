select
    p.segment_id as segment_id,
    sum(p.t3) as g1,
    sum(p.t5) as g2,
    sum(p.t5) as g3,
    avg(p.t5) as g4
from {{ ref('cust_0588') }} as p
group by p.segment_id
