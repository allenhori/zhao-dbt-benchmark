select
    p0.segment_id as segment_id,
    p0.g3 - p2.g1 as r1,
    p1.g1 as r2,
    p2.g2 * 0.5 + p0.g1 * 0.5 as r3,
    p0.g1 as r4
from {{ ref('seg_0016') }} as p0
inner join {{ ref('seg_0165') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0373') }} as p2 on p2.segment_id = p0.segment_id
