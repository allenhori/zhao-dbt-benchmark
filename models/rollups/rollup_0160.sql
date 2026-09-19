select
    p0.segment_id as segment_id,
    p0.r1 * 0.5 + p1.g1 * 0.5 as r1,
    p0.r3 * 0.5 + p2.g2 * 0.5 as r2
from {{ ref('rollup_0030') }} as p0
inner join {{ ref('seg_0270') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0018') }} as p2 on p2.segment_id = p0.segment_id
