select
    p.segment_id as segment_id,
    avg(p.s4) as g1,
    max(p.s4) as g2,
    sum(p.s5) as g3
from {{ ref('cust_0217') }} as p
group by p.segment_id
