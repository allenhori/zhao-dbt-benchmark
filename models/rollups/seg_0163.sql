select
    p.segment_id as segment_id,
    avg(p.s4) as g1,
    sum(p.s3) as g2,
    sum(p.s3) as g3,
    avg(p.s3) as g4
from {{ ref('cust_0888') }} as p
group by p.segment_id
