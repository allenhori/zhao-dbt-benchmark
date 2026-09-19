select
    p0.segment_id as segment_id,
    p1.g1 * 0.5 + p2.r1 * 0.5 as r1,
    p2.r1 as r2,
    p0.g3 + p2.r4 as r3,
    p1.g4 as r4
from {{ ref('seg_0388') }} as p0
inner join {{ ref('seg_0279') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0032') }} as p2 on p2.segment_id = p0.segment_id
