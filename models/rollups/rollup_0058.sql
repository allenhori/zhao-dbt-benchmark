select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    p1.g3 * 0.5 + p0.g4 * 0.5 as r2,
    p1.g3 as r3,
    p1.g1 as r4
from {{ ref('seg_0355') }} as p0
inner join {{ ref('seg_0185') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0038') }} as p2 on p2.segment_id = p0.segment_id
