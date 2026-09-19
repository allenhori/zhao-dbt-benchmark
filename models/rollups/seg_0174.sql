select
    p.segment_id as segment_id,
    max(p.s1) as g1,
    max(p.s3) as g2,
    sum(p.s1) as g3,
    avg(p.s1) as g4
from {{ ref('cust_0502') }} as p
group by p.segment_id
