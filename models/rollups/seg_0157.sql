select
    p.segment_id as segment_id,
    sum(p.s4) as g1,
    max(p.s3) as g2,
    sum(p.s4) as g3
from {{ ref('cust_0675') }} as p
group by p.segment_id
