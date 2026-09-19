select
    p.segment_id as segment_id,
    max(p.s3) as g1,
    avg(p.s3) as g2,
    max(p.s1) as g3
from {{ ref('cust_0131') }} as p
group by p.segment_id
