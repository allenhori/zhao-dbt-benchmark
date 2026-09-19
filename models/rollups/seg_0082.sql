select
    p.segment_id as segment_id,
    sum(p.s1) as g1,
    avg(p.s2) as g2,
    sum(p.s1) as g3,
    avg(p.s1) as g4
from {{ ref('cust_0467') }} as p
group by p.segment_id
