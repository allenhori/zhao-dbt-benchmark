select
    p.segment_id as segment_id,
    avg(p.s5) as g1,
    sum(p.s5) as g2,
    avg(p.s5) as g3,
    sum(p.s4) as g4
from {{ ref('cust_0636') }} as p
group by p.segment_id
