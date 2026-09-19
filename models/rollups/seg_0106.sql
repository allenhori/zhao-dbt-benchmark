select
    p.segment_id as segment_id,
    sum(p.t1) as g1,
    avg(p.t2) as g2,
    max(p.t1) as g3
from {{ ref('cust_0802') }} as p
group by p.segment_id
