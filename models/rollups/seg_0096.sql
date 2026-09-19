select
    p.segment_id as segment_id,
    avg(p.t3) as g1,
    sum(p.t3) as g2,
    avg(p.t5) as g3
from {{ ref('cust_0709') }} as p
group by p.segment_id
