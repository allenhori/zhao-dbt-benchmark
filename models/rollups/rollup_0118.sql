select
    p0.segment_id as segment_id,
    p2.g2 as r1,
    p1.g2 as r2,
    p0.g3 as r3,
    p1.g2 as r4
from {{ ref('seg_0013') }} as p0
inner join {{ ref('seg_0291') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0255') }} as p2 on p2.segment_id = p0.segment_id
