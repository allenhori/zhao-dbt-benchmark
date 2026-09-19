select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    case when p0.g2 > p1.g1 then p0.g2 else p1.g1 end as r2,
    p1.g4 as r3,
    case when p0.g4 > p1.g3 then p0.g4 else p1.g3 end as r4
from {{ ref('seg_0142') }} as p0
inner join {{ ref('seg_0048') }} as p1 on p1.segment_id = p0.segment_id
