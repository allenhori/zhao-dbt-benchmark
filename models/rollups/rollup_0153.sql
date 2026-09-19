select
    p0.segment_id as segment_id,
    p2.g1 * 0.5 + p1.r3 * 0.5 as r1,
    p1.r4 * 0.5 + p2.g1 * 0.5 as r2,
    p1.r1 as r3,
    p2.g2 * 0.5 + p0.g4 * 0.5 as r4
from {{ ref('seg_0018') }} as p0
inner join {{ ref('rollup_0004') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0139') }} as p2 on p2.segment_id = p0.segment_id
