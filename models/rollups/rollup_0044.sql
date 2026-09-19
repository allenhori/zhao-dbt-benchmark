select
    p0.segment_id as segment_id,
    p1.g3 as r1,
    p2.g2 as r2,
    case when p2.g3 > p1.g1 then p2.g3 else p1.g1 end as r3,
    p2.g1 as r4
from {{ ref('seg_0078') }} as p0
inner join {{ ref('seg_0232') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0105') }} as p2 on p2.segment_id = p0.segment_id
