select
    p.segment_id as segment_id,
    avg(p.t4) as g1,
    sum(p.t4) as g2,
    sum(p.t4) as g3
from {{ ref('cust_0866') }} as p
group by p.segment_id
