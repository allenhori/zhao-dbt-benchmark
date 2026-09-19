select
    p.segment_id as segment_id,
    sum(p.s1) as g1,
    sum(p.s5) as g2,
    avg(p.s5) as g3
from {{ ref('cust_0143') }} as p
group by p.segment_id
