select
    p0.segment_id as segment_id,
    p2.g3 as r1,
    p0.g1 as r2,
    p1.g3 * 0.5 + p2.g2 * 0.5 as r3,
    p0.g3 * 0.5 + p1.g2 * 0.5 as r4
from {{ ref('seg_0377') }} as p0
inner join {{ ref('seg_0263') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0088') }} as p2 on p2.segment_id = p0.segment_id
