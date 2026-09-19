select
    p0.segment_id as segment_id,
    p1.g1 as r1,
    p0.g3 * 0.5 + p1.g1 * 0.5 as r2,
    p0.g4 as r3
from {{ ref('seg_0332') }} as p0
inner join {{ ref('seg_0051') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0203') }} as p2 on p2.segment_id = p0.segment_id
