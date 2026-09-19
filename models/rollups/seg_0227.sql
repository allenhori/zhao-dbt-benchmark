select
    p.segment_id as segment_id,
    max(p.s3) as g1,
    max(p.s2) as g2,
    max(p.s3) as g3,
    avg(p.s2) as g4
from {{ ref('cust_0578') }} as p
group by p.segment_id
