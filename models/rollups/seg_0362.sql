select
    p.segment_id as segment_id,
    max(p.s4) as g1,
    max(p.s4) as g2,
    sum(p.s4) as g3,
    avg(p.s3) as g4
from {{ ref('cust_0234') }} as p
group by p.segment_id
