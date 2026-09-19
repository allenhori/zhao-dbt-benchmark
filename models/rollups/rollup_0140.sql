select
    p0.segment_id as segment_id,
    p1.g4 + p2.g2 as r1,
    p1.g4 * 0.5 + p2.g1 * 0.5 as r2
from {{ ref('seg_0333') }} as p0
inner join {{ ref('seg_0168') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0319') }} as p2 on p2.segment_id = p0.segment_id
