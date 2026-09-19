select
    p0.segment_id as segment_id,
    p2.g2 + p0.g1 as r1,
    p0.g3 as r2,
    p1.g2 * 0.5 + p0.g4 * 0.5 as r3,
    p1.g2 as r4
from {{ ref('seg_0170') }} as p0
inner join {{ ref('seg_0191') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0252') }} as p2 on p2.segment_id = p0.segment_id
