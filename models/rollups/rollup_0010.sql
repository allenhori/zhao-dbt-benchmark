select
    p0.segment_id as segment_id,
    p1.g3 - p0.g2 as r1,
    p2.g3 as r2,
    p0.g1 * 0.5 + p1.g1 * 0.5 as r3
from {{ ref('seg_0374') }} as p0
inner join {{ ref('seg_0048') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0256') }} as p2 on p2.segment_id = p0.segment_id
