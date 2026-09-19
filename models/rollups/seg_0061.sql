select
    p.segment_id as segment_id,
    sum(p.s6) as g1,
    max(p.s3) as g2,
    avg(p.s3) as g3,
    sum(p.s6) as g4
from {{ ref('cust_0286') }} as p
group by p.segment_id
