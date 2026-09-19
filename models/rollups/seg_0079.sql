select
    p.segment_id as segment_id,
    avg(p.t2) as g1,
    sum(p.t2) as g2,
    avg(p.t6) as g3
from {{ ref('cust_0701') }} as p
group by p.segment_id
