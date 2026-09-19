select
    p0.segment_id as segment_id,
    p0.g2 as r1,
    p2.g3 * 0.5 + p1.g3 * 0.5 as r2,
    p1.g3 - p2.g1 as r3
from {{ ref('seg_0382') }} as p0
inner join {{ ref('seg_0381') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0176') }} as p2 on p2.segment_id = p0.segment_id
