select
    p.segment_id as segment_id,
    max(p.t1) as g1,
    avg(p.t1) as g2,
    avg(p.t3) as g3
from {{ ref('cust_0441') }} as p
group by p.segment_id
