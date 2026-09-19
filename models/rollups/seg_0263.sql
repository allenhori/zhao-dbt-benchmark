select
    p.segment_id as segment_id,
    sum(p.s6) as g1,
    avg(p.s1) as g2,
    avg(p.s1) as g3
from {{ ref('cust_0546') }} as p
group by p.segment_id
