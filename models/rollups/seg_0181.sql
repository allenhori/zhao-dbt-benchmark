select
    p.segment_id as segment_id,
    sum(p.t4) as g1,
    sum(p.t4) as g2,
    max(p.t4) as g3
from {{ ref('cust_0157') }} as p
group by p.segment_id
