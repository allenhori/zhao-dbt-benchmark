select
    p.segment_id as segment_id,
    avg(p.t4) as g1,
    max(p.t4) as g2,
    sum(p.t3) as g3
from {{ ref('cust_0133') }} as p
group by p.segment_id
