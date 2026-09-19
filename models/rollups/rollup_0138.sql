select
    p0.segment_id as segment_id,
    p1.g2 * 0.5 + p2.g3 * 0.5 as r1,
    p2.g2 as r2
from {{ ref('seg_0268') }} as p0
inner join {{ ref('seg_0107') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0378') }} as p2 on p2.segment_id = p0.segment_id
