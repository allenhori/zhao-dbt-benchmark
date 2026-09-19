select
    p.segment_id as segment_id,
    sum(p.t5) as g1,
    avg(p.t5) as g2,
    avg(p.t4) as g3
from {{ ref('cust_0622') }} as p
group by p.segment_id
