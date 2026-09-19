select
    p.segment_id as segment_id,
    sum(p.s1) as g1,
    max(p.s1) as g2,
    avg(p.s1) as g3
from {{ ref('cust_0793') }} as p
group by p.segment_id
