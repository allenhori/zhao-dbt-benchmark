select
    p0.segment_id as segment_id,
    p0.g3 * 0.5 + p1.g2 * 0.5 as r1,
    p0.g3 + p2.g3 as r2,
    p0.g2 * 0.5 + p2.g1 * 0.5 as r3
from {{ ref('seg_0253') }} as p0
inner join {{ ref('seg_0018') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0332') }} as p2 on p2.segment_id = p0.segment_id
