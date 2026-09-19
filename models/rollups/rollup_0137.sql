select
    p0.segment_id as segment_id,
    p0.r2 as r1,
    p0.r2 as r2,
    p1.g4 + p0.r2 as r3
from {{ ref('rollup_0034') }} as p0
inner join {{ ref('seg_0037') }} as p1 on p1.segment_id = p0.segment_id
