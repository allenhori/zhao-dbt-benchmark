select
    p0.segment_id as segment_id,
    p1.g2 + p0.g3 as r1,
    p1.g1 as r2
from {{ ref('seg_0306') }} as p0
inner join {{ ref('seg_0047') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0131') }} as p2 on p2.segment_id = p0.segment_id
