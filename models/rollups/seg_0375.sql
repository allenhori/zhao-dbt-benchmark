select
    p.segment_id as segment_id,
    sum(p.t4) as g1,
    max(p.t3) as g2,
    sum(p.t4) as g3
from {{ ref('cust_0213') }} as p
group by p.segment_id
