select
    p.segment_id as segment_id,
    avg(p.t1) as g1,
    sum(p.t2) as g2,
    sum(p.t1) as g3,
    sum(p.t1) as g4
from {{ ref('cust_0727') }} as p
group by p.segment_id
