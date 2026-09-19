select
    p.segment_id as segment_id,
    sum(p.s3) as g1,
    sum(p.s2) as g2,
    sum(p.s2) as g3,
    sum(p.s3) as g4
from {{ ref('cust_0607') }} as p
group by p.segment_id
