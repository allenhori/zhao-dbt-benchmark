select
    p0.segment_id as segment_id,
    case when p0.g3 > p1.g1 then p0.g3 else p1.g1 end as r1,
    p0.g2 * 0.5 + p1.g3 * 0.5 as r2,
    case when p0.g3 > p1.g4 then p0.g3 else p1.g4 end as r3,
    case when p0.g1 > p1.g2 then p0.g1 else p1.g2 end as r4
from {{ ref('seg_0133') }} as p0
inner join {{ ref('seg_0312') }} as p1 on p1.segment_id = p0.segment_id
