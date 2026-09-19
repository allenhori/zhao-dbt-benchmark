select
    p.segment_id as segment_id,
    sum(p.s5) as g1,
    sum(p.s5) as g2,
    avg(p.s3) as g3
from {{ ref('cust_0773') }} as p
group by p.segment_id
