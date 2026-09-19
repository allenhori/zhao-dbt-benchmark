select
    p0.segment_id as segment_id,
    p1.r4 as r1,
    p0.g1 + p1.r2 as r2,
    p1.r2 * 0.5 + p0.g1 * 0.5 as r3
from {{ ref('seg_0291') }} as p0
inner join {{ ref('rollup_0110') }} as p1 on p1.segment_id = p0.segment_id
