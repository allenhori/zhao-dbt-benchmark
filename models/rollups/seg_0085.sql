select
    p.segment_id as segment_id,
    sum(p.t2) as g1,
    max(p.t2) as g2,
    sum(p.t3) as g3
from {{ ref('cust_0522') }} as p
group by p.segment_id
