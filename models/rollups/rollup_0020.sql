select
    p0.segment_id as segment_id,
    case when p1.g1 > p0.g1 then p1.g1 else p0.g1 end as r1,
    p0.g3 - p1.g1 as r2,
    p0.g4 - p1.g3 as r3,
    p0.g2 as r4
from {{ ref('seg_0177') }} as p0
inner join {{ ref('seg_0136') }} as p1 on p1.segment_id = p0.segment_id
