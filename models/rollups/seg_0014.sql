select
    p.segment_id as segment_id,
    avg(p.s2) as g1,
    max(p.s2) as g2,
    sum(p.s1) as g3,
    max(p.s1) as g4
from {{ ref('cust_0175') }} as p
group by p.segment_id
