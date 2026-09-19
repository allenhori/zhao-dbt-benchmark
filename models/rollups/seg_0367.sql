select
    p.segment_id as segment_id,
    sum(p.t3) as g1,
    max(p.t4) as g2,
    avg(p.t3) as g3
from {{ ref('cust_0513') }} as p
group by p.segment_id
