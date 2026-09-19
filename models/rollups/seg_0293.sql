select
    p.segment_id as segment_id,
    max(p.t4) as g1,
    avg(p.t1) as g2,
    sum(p.t4) as g3
from {{ ref('cust_0621') }} as p
group by p.segment_id
