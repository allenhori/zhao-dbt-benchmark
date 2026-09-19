select
    p.segment_id as segment_id,
    sum(p.s6) as g1,
    sum(p.s4) as g2,
    sum(p.s6) as g3
from {{ ref('cust_0872') }} as p
group by p.segment_id
