select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    case when p2.g3 > p0.r3 then p2.g3 else p0.r3 end as r2,
    p1.g3 + p0.r3 as r3,
    p0.r3 as r4
from {{ ref('rollup_0095') }} as p0
inner join {{ ref('seg_0380') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0358') }} as p2 on p2.segment_id = p0.segment_id
