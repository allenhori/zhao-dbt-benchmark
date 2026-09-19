select
    p.segment_id as segment_id,
    max(p.s1) as g1,
    max(p.s1) as g2,
    sum(p.s2) as g3
from {{ ref('cust_0438') }} as p
group by p.segment_id
