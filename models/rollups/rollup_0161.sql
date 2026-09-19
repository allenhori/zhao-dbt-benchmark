select
    p0.segment_id as segment_id,
    p2.g2 * 0.5 + p1.g4 * 0.5 as r1,
    p0.g1 * 0.5 + p2.g1 * 0.5 as r2,
    case when p0.g1 > p2.g1 then p0.g1 else p2.g1 end as r3
from {{ ref('seg_0055') }} as p0
inner join {{ ref('seg_0212') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0079') }} as p2 on p2.segment_id = p0.segment_id
