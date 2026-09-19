select
    p0.segment_id as segment_id,
    p1.g1 as r1,
    p0.g3 + p1.g2 as r2,
    p0.g2 as r3,
    p2.r2 + p0.g2 as r4
from {{ ref('seg_0200') }} as p0
inner join {{ ref('seg_0055') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0146') }} as p2 on p2.segment_id = p0.segment_id
