select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    p2.g1 + p0.g3 as r2,
    p1.g1 + p2.g4 as r3
from {{ ref('seg_0198') }} as p0
inner join {{ ref('seg_0073') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0112') }} as p2 on p2.segment_id = p0.segment_id
