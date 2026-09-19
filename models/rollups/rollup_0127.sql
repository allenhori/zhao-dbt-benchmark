select
    p0.segment_id as segment_id,
    p2.g2 as r1,
    p0.g2 + p1.g2 as r2,
    p0.g2 as r3
from {{ ref('seg_0087') }} as p0
inner join {{ ref('seg_0378') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0060') }} as p2 on p2.segment_id = p0.segment_id
