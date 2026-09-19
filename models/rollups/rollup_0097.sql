select
    p0.segment_id as segment_id,
    p0.r1 as r1,
    p1.r1 as r2
from {{ ref('rollup_0029') }} as p0
inner join {{ ref('rollup_0066') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0256') }} as p2 on p2.segment_id = p0.segment_id
