select
    p0.segment_id as segment_id,
    p1.r2 as r1,
    p0.g4 - p1.r1 as r2,
    p0.g3 + p2.r3 as r3
from {{ ref('seg_0186') }} as p0
inner join {{ ref('rollup_0021') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0005') }} as p2 on p2.segment_id = p0.segment_id
