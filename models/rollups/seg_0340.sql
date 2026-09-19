select
    p.segment_id as segment_id,
    sum(p.t2) as g1,
    sum(p.t4) as g2,
    sum(p.t2) as g3,
    max(p.t4) as g4
from {{ ref('cust_0033') }} as p
group by p.segment_id
