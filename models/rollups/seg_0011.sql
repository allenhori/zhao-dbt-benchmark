select
    p.segment_id as segment_id,
    avg(p.t5) as g1,
    max(p.t5) as g2,
    sum(p.t5) as g3
from {{ ref('cust_0430') }} as p
group by p.segment_id
