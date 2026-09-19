select
    p.segment_id as segment_id,
    sum(p.s1) as g1,
    sum(p.s4) as g2,
    sum(p.s4) as g3
from {{ ref('cust_0334') }} as p
group by p.segment_id
