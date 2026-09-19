select
    p0.segment_id as segment_id,
    p1.g2 + p0.g3 as r1,
    case when p0.g1 > p1.g4 then p0.g1 else p1.g4 end as r2,
    p1.g1 as r3,
    p1.g3 as r4
from {{ ref('seg_0198') }} as p0
inner join {{ ref('seg_0163') }} as p1 on p1.segment_id = p0.segment_id
