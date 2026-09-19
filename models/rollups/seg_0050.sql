select
    p.segment_id as segment_id,
    max(p.s1) as g1,
    sum(p.s1) as g2,
    max(p.s1) as g3
from {{ ref('cust_0883') }} as p
group by p.segment_id
