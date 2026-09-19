select
    p.segment_id as segment_id,
    avg(p.t6) as g1,
    max(p.t6) as g2,
    sum(p.t2) as g3,
    avg(p.t6) as g4
from {{ ref('cust_0077') }} as p
group by p.segment_id
