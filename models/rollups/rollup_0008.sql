select
    p0.segment_id as segment_id,
    p1.g4 as r1,
    p0.g2 as r2,
    p0.g2 as r3
from {{ ref('seg_0296') }} as p0
inner join {{ ref('seg_0236') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0376') }} as p2 on p2.segment_id = p0.segment_id
