select
    p.segment_id as segment_id,
    sum(p.t5) as g1,
    sum(p.t3) as g2,
    sum(p.t5) as g3
from {{ ref('cust_0805') }} as p
group by p.segment_id
