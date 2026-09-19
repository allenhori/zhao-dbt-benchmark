select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p0.g1 as r2,
    p1.g1 - p2.g1 as r3,
    p0.g2 as r4
from {{ ref('seg_0216') }} as p0
inner join {{ ref('seg_0178') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0360') }} as p2 on p2.segment_id = p0.segment_id
