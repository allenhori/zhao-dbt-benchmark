select
    p.segment_id as segment_id,
    max(p.s4) as g1,
    avg(p.s4) as g2,
    max(p.s3) as g3
from {{ ref('cust_0417') }} as p
group by p.segment_id
