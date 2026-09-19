select
    p.segment_id as segment_id,
    avg(p.t3) as g1,
    sum(p.t1) as g2,
    avg(p.t3) as g3,
    max(p.t1) as g4
from {{ ref('cust_0647') }} as p
group by p.segment_id
