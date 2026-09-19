select
    p.segment_id as segment_id,
    max(p.s3) as g1,
    max(p.s3) as g2,
    avg(p.s2) as g3
from {{ ref('cust_0082') }} as p
group by p.segment_id
