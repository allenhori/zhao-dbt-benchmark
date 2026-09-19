select
    p0.segment_id as segment_id,
    p1.g4 as r1,
    p1.g2 + p2.g3 as r2,
    p1.g4 + p0.g1 as r3
from {{ ref('seg_0399') }} as p0
inner join {{ ref('seg_0142') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0306') }} as p2 on p2.segment_id = p0.segment_id
