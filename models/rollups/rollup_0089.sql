select
    p0.segment_id as segment_id,
    p2.g1 - p1.g4 as r1,
    p0.g1 as r2,
    p0.g2 as r3
from {{ ref('seg_0254') }} as p0
inner join {{ ref('seg_0227') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0108') }} as p2 on p2.segment_id = p0.segment_id
