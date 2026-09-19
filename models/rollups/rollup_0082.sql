select
    p0.segment_id as segment_id,
    p1.g1 as r1,
    p0.g2 as r2,
    p1.g3 as r3,
    p1.g3 - p0.g1 as r4
from {{ ref('seg_0266') }} as p0
inner join {{ ref('seg_0389') }} as p1 on p1.segment_id = p0.segment_id
