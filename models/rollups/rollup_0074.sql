select
    p0.segment_id as segment_id,
    p2.g1 + p0.g3 as r1,
    p0.g2 * 0.5 + p1.g4 * 0.5 as r2,
    case when p2.g2 > p0.g1 then p2.g2 else p0.g1 end as r3,
    p2.g3 - p1.g2 as r4
from {{ ref('seg_0173') }} as p0
inner join {{ ref('seg_0325') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0240') }} as p2 on p2.segment_id = p0.segment_id
