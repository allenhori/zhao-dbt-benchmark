select
    p.segment_id as segment_id,
    avg(p.t4) as g1,
    max(p.t4) as g2,
    max(p.t6) as g3
from {{ ref('cust_0001') }} as p
group by p.segment_id
