select
    p.segment_id as segment_id,
    sum(p.s1) as g1,
    avg(p.s1) as g2,
    max(p.s2) as g3
from {{ ref('cust_0151') }} as p
group by p.segment_id
