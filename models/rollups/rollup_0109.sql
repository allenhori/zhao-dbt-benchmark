select
    p0.segment_id as segment_id,
    case when p0.g3 > p1.r1 then p0.g3 else p1.r1 end as r1,
    p1.r1 as r2,
    p1.r2 as r3,
    p1.r2 + p0.g4 as r4
from {{ ref('seg_0163') }} as p0
inner join {{ ref('rollup_0066') }} as p1 on p1.segment_id = p0.segment_id
