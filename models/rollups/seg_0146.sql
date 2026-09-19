select
    p.segment_id as segment_id,
    avg(p.t3) as g1,
    max(p.t3) as g2,
    max(p.t4) as g3
from {{ ref('cust_0127') }} as p
group by p.segment_id
