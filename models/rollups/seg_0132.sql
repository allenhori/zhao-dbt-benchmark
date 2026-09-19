select
    p.segment_id as segment_id,
    sum(p.s5) as g1,
    sum(p.s2) as g2,
    sum(p.s5) as g3,
    avg(p.s5) as g4
from {{ ref('cust_0451') }} as p
group by p.segment_id
