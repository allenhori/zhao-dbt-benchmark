select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p1.g2 - p2.g4 as r2,
    p1.g3 as r3,
    p2.g4 as r4
from {{ ref('seg_0123') }} as p0
inner join {{ ref('seg_0066') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0330') }} as p2 on p2.segment_id = p0.segment_id
