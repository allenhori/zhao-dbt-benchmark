select
    p.segment_id as segment_id,
    avg(p.t3) as g1,
    avg(p.t3) as g2,
    sum(p.t6) as g3
from {{ ref('cust_0687') }} as p
group by p.segment_id
