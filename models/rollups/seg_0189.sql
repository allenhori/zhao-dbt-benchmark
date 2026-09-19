select
    p.segment_id as segment_id,
    max(p.t3) as g1,
    avg(p.t4) as g2,
    sum(p.t4) as g3
from {{ ref('cust_0127') }} as p
group by p.segment_id
