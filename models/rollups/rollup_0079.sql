select
    p0.segment_id as segment_id,
    case when p2.g2 > p0.g2 then p2.g2 else p0.g2 end as r1,
    p0.g2 as r2,
    p1.g3 as r3
from {{ ref('seg_0095') }} as p0
inner join {{ ref('seg_0047') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0051') }} as p2 on p2.segment_id = p0.segment_id
