select
    p0.segment_id as segment_id,
    case when p0.g2 > p1.g3 then p0.g2 else p1.g3 end as r1,
    p1.g3 * 0.5 + p0.g3 * 0.5 as r2,
    p0.g3 as r3,
    p0.g1 * 0.5 + p1.g3 * 0.5 as r4
from {{ ref('seg_0379') }} as p0
inner join {{ ref('seg_0239') }} as p1 on p1.segment_id = p0.segment_id
