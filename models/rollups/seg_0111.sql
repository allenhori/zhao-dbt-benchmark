select
    p.segment_id as segment_id,
    max(p.t5) as g1,
    max(p.t5) as g2,
    avg(p.t2) as g3
from {{ ref('cust_0187') }} as p
group by p.segment_id
