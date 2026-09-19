select
    p0.segment_id as segment_id,
    p1.r3 as r1,
    p0.g3 * 0.5 + p2.g2 * 0.5 as r2,
    p1.r3 - p0.g1 as r3,
    p1.r2 as r4
from {{ ref('seg_0132') }} as p0
inner join {{ ref('rollup_0008') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0058') }} as p2 on p2.segment_id = p0.segment_id
