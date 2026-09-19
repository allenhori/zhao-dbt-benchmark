select
    p.segment_id as segment_id,
    avg(p.t1) as g1,
    sum(p.t5) as g2,
    max(p.t1) as g3,
    sum(p.t5) as g4
from {{ ref('cust_0884') }} as p
group by p.segment_id
