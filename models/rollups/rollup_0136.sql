select
    p0.segment_id as segment_id,
    p1.g2 + p0.g3 as r1,
    p1.g1 * 0.5 + p0.g3 * 0.5 as r2,
    p0.g2 as r3
from {{ ref('seg_0165') }} as p0
inner join {{ ref('seg_0363') }} as p1 on p1.segment_id = p0.segment_id
