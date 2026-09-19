select
    p.segment_id as segment_id,
    avg(p.s2) as g1,
    sum(p.s1) as g2,
    sum(p.s2) as g3
from {{ ref('cust_0309') }} as p
group by p.segment_id
