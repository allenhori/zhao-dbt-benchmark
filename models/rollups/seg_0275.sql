select
    p.segment_id as segment_id,
    max(p.s4) as g1,
    avg(p.s3) as g2,
    max(p.s3) as g3,
    avg(p.s3) as g4
from {{ ref('cust_0515') }} as p
group by p.segment_id
