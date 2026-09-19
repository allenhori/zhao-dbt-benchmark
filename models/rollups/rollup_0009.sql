select
    p0.segment_id as segment_id,
    p1.g2 + p0.g2 as r1,
    p2.g1 * 0.5 + p1.g1 * 0.5 as r2,
    p2.g1 * 0.5 + p0.g4 * 0.5 as r3,
    p1.g2 as r4
from {{ ref('seg_0333') }} as p0
inner join {{ ref('seg_0142') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0240') }} as p2 on p2.segment_id = p0.segment_id
