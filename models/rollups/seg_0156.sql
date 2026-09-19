select
    p.segment_id as segment_id,
    sum(p.t2) as g1,
    max(p.t2) as g2,
    avg(p.t1) as g3
from {{ ref('cust_0495') }} as p
group by p.segment_id
