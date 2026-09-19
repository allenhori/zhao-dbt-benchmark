select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    p0.r2 - p1.g1 as r2,
    p1.g2 + p0.r3 as r3
from {{ ref('rollup_0093') }} as p0
inner join {{ ref('seg_0100') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0055') }} as p2 on p2.segment_id = p0.segment_id
