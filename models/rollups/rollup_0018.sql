select
    p0.segment_id as segment_id,
    p0.g1 - p2.g1 as r1,
    p1.g3 - p0.g4 as r2,
    p2.g3 * 0.5 + p0.g4 * 0.5 as r3,
    case when p1.g2 > p0.g4 then p1.g2 else p0.g4 end as r4
from {{ ref('seg_0374') }} as p0
inner join {{ ref('seg_0396') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0212') }} as p2 on p2.segment_id = p0.segment_id
