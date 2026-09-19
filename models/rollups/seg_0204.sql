select
    p.segment_id as segment_id,
    avg(p.t1) as g1,
    max(p.t5) as g2,
    avg(p.t1) as g3
from {{ ref('cust_0705') }} as p
group by p.segment_id
