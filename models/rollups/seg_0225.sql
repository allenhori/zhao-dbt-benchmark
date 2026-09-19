select
    p.segment_id as segment_id,
    max(p.s2) as g1,
    sum(p.s3) as g2,
    max(p.s2) as g3,
    avg(p.s3) as g4
from {{ ref('cust_0672') }} as p
group by p.segment_id
