select
    p.segment_id as segment_id,
    sum(p.t3) as g1,
    avg(p.t5) as g2,
    max(p.t5) as g3
from {{ ref('cust_0400') }} as p
group by p.segment_id
