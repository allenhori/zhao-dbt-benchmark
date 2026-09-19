select
    p.segment_id as segment_id,
    avg(p.t6) as g1,
    avg(p.t4) as g2,
    sum(p.t6) as g3
from {{ ref('cust_0103') }} as p
group by p.segment_id
