select
    p.segment_id as segment_id,
    max(p.s2) as g1,
    sum(p.s3) as g2,
    avg(p.s3) as g3,
    sum(p.s2) as g4
from {{ ref('cust_0593') }} as p
group by p.segment_id
