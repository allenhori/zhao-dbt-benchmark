select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p1.g2 as r2,
    p2.g3 as r3
from {{ ref('seg_0172') }} as p0
inner join {{ ref('seg_0121') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0103') }} as p2 on p2.segment_id = p0.segment_id
