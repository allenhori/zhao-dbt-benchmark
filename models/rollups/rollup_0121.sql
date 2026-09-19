select
    p0.segment_id as segment_id,
    p1.r1 as r1,
    case when p0.g3 > p2.g3 then p0.g3 else p2.g3 end as r2,
    p0.g4 as r3,
    p2.g3 - p1.r1 as r4
from {{ ref('seg_0007') }} as p0
inner join {{ ref('rollup_0112') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0337') }} as p2 on p2.segment_id = p0.segment_id
