select
    p.segment_id as segment_id,
    avg(p.s4) as g1,
    sum(p.s4) as g2,
    avg(p.s4) as g3
from {{ ref('cust_0304') }} as p
group by p.segment_id
