select
    p0.segment_id as segment_id,
    p1.g1 + p0.g3 as r1,
    p1.g3 + p0.g2 as r2,
    p1.g2 as r3,
    p0.g4 as r4
from {{ ref('seg_0229') }} as p0
inner join {{ ref('seg_0294') }} as p1 on p1.segment_id = p0.segment_id
