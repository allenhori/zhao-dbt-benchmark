select
    p0.segment_id as segment_id,
    p2.g1 as r1,
    p2.g3 as r2,
    p0.g1 * 0.5 + p2.g4 * 0.5 as r3,
    p0.g3 - p2.g4 as r4
from {{ ref('seg_0071') }} as p0
inner join {{ ref('seg_0368') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0214') }} as p2 on p2.segment_id = p0.segment_id
