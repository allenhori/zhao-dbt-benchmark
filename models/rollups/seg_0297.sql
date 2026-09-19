select
    p.segment_id as segment_id,
    avg(p.s3) as g1,
    avg(p.s1) as g2,
    max(p.s1) as g3,
    sum(p.s1) as g4
from {{ ref('cust_0270') }} as p
group by p.segment_id
