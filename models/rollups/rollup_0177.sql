select
    p0.segment_id as segment_id,
    p2.g3 - p0.r3 as r1,
    p0.r3 - p1.g1 as r2,
    p1.g2 * 0.5 + p0.r4 * 0.5 as r3,
    p2.g2 + p1.g1 as r4
from {{ ref('rollup_0058') }} as p0
inner join {{ ref('seg_0275') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0018') }} as p2 on p2.segment_id = p0.segment_id
