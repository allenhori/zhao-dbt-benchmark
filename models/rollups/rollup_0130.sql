select
    p0.segment_id as segment_id,
    p1.g1 as r1,
    p0.g3 - p1.g4 as r2,
    p1.g2 as r3,
    p1.g3 + p0.g2 as r4
from {{ ref('seg_0247') }} as p0
inner join {{ ref('seg_0340') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0047') }} as p2 on p2.segment_id = p0.segment_id
