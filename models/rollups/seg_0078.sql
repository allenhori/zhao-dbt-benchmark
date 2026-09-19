select
    p.segment_id as segment_id,
    max(p.s6) as g1,
    sum(p.s6) as g2,
    max(p.s3) as g3,
    sum(p.s6) as g4
from {{ ref('cust_0240') }} as p
group by p.segment_id
