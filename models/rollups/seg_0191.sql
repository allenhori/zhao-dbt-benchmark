select
    p.segment_id as segment_id,
    max(p.s4) as g1,
    sum(p.s1) as g2,
    avg(p.s4) as g3
from {{ ref('cust_0435') }} as p
group by p.segment_id
