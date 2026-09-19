select
    p.segment_id as segment_id,
    max(p.s3) as g1,
    sum(p.s4) as g2,
    avg(p.s4) as g3,
    max(p.s4) as g4
from {{ ref('cust_0675') }} as p
group by p.segment_id
