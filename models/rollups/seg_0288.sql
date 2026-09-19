select
    p.segment_id as segment_id,
    avg(p.s1) as g1,
    max(p.s3) as g2,
    sum(p.s3) as g3
from {{ ref('cust_0267') }} as p
group by p.segment_id
