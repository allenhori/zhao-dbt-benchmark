select
    p0.segment_id as segment_id,
    p2.g2 as r1,
    p1.g4 - p0.g3 as r2,
    p1.g4 - p2.g1 as r3,
    case when p0.g3 > p2.g2 then p0.g3 else p2.g2 end as r4
from {{ ref('seg_0259') }} as p0
inner join {{ ref('seg_0382') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0304') }} as p2 on p2.segment_id = p0.segment_id
