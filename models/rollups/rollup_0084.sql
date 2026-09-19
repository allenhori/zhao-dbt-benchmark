select
    p0.segment_id as segment_id,
    p2.g4 as r1,
    p2.g1 as r2,
    p2.g2 as r3
from {{ ref('rollup_0052') }} as p0
inner join {{ ref('rollup_0025') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0180') }} as p2 on p2.segment_id = p0.segment_id
