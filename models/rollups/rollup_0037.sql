select
    p0.segment_id as segment_id,
    p2.r4 as r1,
    p0.g3 as r2
from {{ ref('seg_0365') }} as p0
inner join {{ ref('seg_0082') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0012') }} as p2 on p2.segment_id = p0.segment_id
