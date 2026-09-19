select
    p0.segment_id as segment_id,
    p0.g2 as r1,
    p0.g3 as r2,
    p1.g2 * 0.5 + p0.g2 * 0.5 as r3,
    p0.g2 - p1.g3 as r4
from {{ ref('seg_0107') }} as p0
inner join {{ ref('seg_0010') }} as p1 on p1.segment_id = p0.segment_id
