select
    p0.segment_id as segment_id,
    p2.g4 * 0.5 + p1.g3 * 0.5 as r1,
    p0.g3 as r2,
    p2.g3 as r3
from {{ ref('seg_0159') }} as p0
inner join {{ ref('seg_0397') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0020') }} as p2 on p2.segment_id = p0.segment_id
