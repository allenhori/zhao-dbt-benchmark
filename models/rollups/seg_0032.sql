select
    p.segment_id as segment_id,
    max(p.t1) as g1,
    sum(p.t1) as g2,
    sum(p.t1) as g3
from {{ ref('cust_0584') }} as p
group by p.segment_id
