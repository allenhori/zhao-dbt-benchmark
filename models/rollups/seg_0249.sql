select
    p.segment_id as segment_id,
    sum(p.t2) as g1,
    avg(p.t2) as g2,
    avg(p.t5) as g3
from {{ ref('cust_0077') }} as p
group by p.segment_id
