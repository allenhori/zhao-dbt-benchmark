select
    p.segment_id as segment_id,
    avg(p.t1) as g1,
    sum(p.t1) as g2,
    max(p.t4) as g3
from {{ ref('cust_0884') }} as p
group by p.segment_id
