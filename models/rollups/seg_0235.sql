select
    p.segment_id as segment_id,
    max(p.t2) as g1,
    sum(p.t2) as g2,
    max(p.t6) as g3
from {{ ref('cust_0553') }} as p
group by p.segment_id
