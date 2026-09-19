select
    p.segment_id as segment_id,
    avg(p.t2) as g1,
    avg(p.t2) as g2,
    max(p.t3) as g3
from {{ ref('cust_0260') }} as p
group by p.segment_id
