select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    p1.g3 * 0.5 + p2.g2 * 0.5 as r2,
    p2.g2 as r3,
    p2.g2 as r4
from {{ ref('seg_0297') }} as p0
inner join {{ ref('seg_0058') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0310') }} as p2 on p2.segment_id = p0.segment_id
