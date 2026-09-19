select
    p.segment_id as segment_id,
    max(p.t3) as g1,
    avg(p.t2) as g2,
    max(p.t3) as g3
from {{ ref('cust_0724') }} as p
group by p.segment_id
