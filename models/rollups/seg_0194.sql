select
    p.segment_id as segment_id,
    avg(p.s3) as g1,
    sum(p.s3) as g2,
    max(p.s2) as g3
from {{ ref('cust_0304') }} as p
group by p.segment_id
