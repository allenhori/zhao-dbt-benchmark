select
    p.segment_id as segment_id,
    max(p.t2) as g1,
    sum(p.t5) as g2,
    sum(p.t2) as g3
from {{ ref('cust_0861') }} as p
group by p.segment_id
