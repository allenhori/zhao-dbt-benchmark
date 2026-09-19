select
    p.segment_id as segment_id,
    avg(p.t6) as g1,
    max(p.t5) as g2,
    sum(p.t5) as g3,
    max(p.t5) as g4
from {{ ref('cust_0460') }} as p
group by p.segment_id
