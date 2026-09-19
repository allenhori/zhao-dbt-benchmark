select
    p.segment_id as segment_id,
    avg(p.s4) as g1,
    sum(p.s4) as g2,
    max(p.s4) as g3
from {{ ref('cust_0136') }} as p
group by p.segment_id
