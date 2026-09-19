select
    p0.segment_id as segment_id,
    p1.r2 as r1,
    p0.g3 as r2,
    p1.r1 - p0.g4 as r3
from {{ ref('seg_0139') }} as p0
inner join {{ ref('rollup_0157') }} as p1 on p1.segment_id = p0.segment_id
