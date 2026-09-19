select
    p.segment_id as segment_id,
    sum(p.t5) as g1,
    max(p.t5) as g2,
    avg(p.t5) as g3,
    avg(p.t1) as g4
from {{ ref('cust_0871') }} as p
group by p.segment_id
