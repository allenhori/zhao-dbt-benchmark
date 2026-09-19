select
    p.segment_id as segment_id,
    sum(p.t3) as g1,
    sum(p.t3) as g2,
    sum(p.t6) as g3
from {{ ref('cust_0029') }} as p
group by p.segment_id
