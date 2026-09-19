select
    p0.segment_id as segment_id,
    p2.g1 * 0.5 + p1.g4 * 0.5 as r1,
    p1.g4 as r2,
    p0.g2 as r3
from {{ ref('seg_0088') }} as p0
inner join {{ ref('seg_0117') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0323') }} as p2 on p2.segment_id = p0.segment_id
