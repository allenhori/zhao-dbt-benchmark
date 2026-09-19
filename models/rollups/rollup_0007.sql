select
    p0.segment_id as segment_id,
    p0.g2 * 0.5 + p1.g3 * 0.5 as r1,
    p0.g2 as r2,
    case when p2.g2 > p1.g1 then p2.g2 else p1.g1 end as r3,
    p0.g3 as r4
from {{ ref('seg_0369') }} as p0
inner join {{ ref('seg_0240') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0271') }} as p2 on p2.segment_id = p0.segment_id
