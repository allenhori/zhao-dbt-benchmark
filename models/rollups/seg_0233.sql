select
    p.segment_id as segment_id,
    max(p.t5) as g1,
    sum(p.t3) as g2,
    max(p.t3) as g3
from {{ ref('cust_0256') }} as p
group by p.segment_id
