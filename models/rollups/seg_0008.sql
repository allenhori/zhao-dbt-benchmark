select
    p.segment_id as segment_id,
    sum(p.t6) as g1,
    avg(p.t5) as g2,
    max(p.t6) as g3,
    sum(p.t6) as g4
from {{ ref('cust_0884') }} as p
group by p.segment_id
