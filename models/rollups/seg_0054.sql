select
    p.segment_id as segment_id,
    max(p.t2) as g1,
    avg(p.t2) as g2,
    max(p.t2) as g3
from {{ ref('cust_0189') }} as p
group by p.segment_id
