select
    p.segment_id as segment_id,
    max(p.t6) as g1,
    avg(p.t6) as g2,
    avg(p.t6) as g3,
    avg(p.t6) as g4
from {{ ref('cust_0063') }} as p
group by p.segment_id
