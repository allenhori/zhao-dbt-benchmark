select
    p0.segment_id as segment_id,
    p1.g1 + p2.g2 as r1,
    p2.g1 * 0.5 + p1.g3 * 0.5 as r2
from {{ ref('seg_0126') }} as p0
inner join {{ ref('seg_0194') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0360') }} as p2 on p2.segment_id = p0.segment_id
