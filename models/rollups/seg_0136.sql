select
    p.segment_id as segment_id,
    sum(p.s3) as g1,
    avg(p.s1) as g2,
    sum(p.s3) as g3,
    max(p.s3) as g4
from {{ ref('cust_0031') }} as p
group by p.segment_id
