select
    p0.segment_id as segment_id,
    p2.g1 * 0.5 + p1.g3 * 0.5 as r1,
    p0.r1 + p1.g2 as r2,
    p2.g1 as r3
from {{ ref('rollup_0014') }} as p0
inner join {{ ref('seg_0072') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0234') }} as p2 on p2.segment_id = p0.segment_id
