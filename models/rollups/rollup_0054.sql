select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    p1.g1 + p0.g2 as r2,
    case when p1.g4 > p0.g2 then p1.g4 else p0.g2 end as r3,
    p1.g4 * 0.5 + p0.g3 * 0.5 as r4
from {{ ref('seg_0171') }} as p0
inner join {{ ref('seg_0114') }} as p1 on p1.segment_id = p0.segment_id
