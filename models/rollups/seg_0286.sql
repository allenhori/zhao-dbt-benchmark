select
    p.segment_id as segment_id,
    avg(p.s4) as g1,
    avg(p.s5) as g2,
    max(p.s5) as g3
from {{ ref('cust_0610') }} as p
group by p.segment_id
