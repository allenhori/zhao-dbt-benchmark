select
    p0.segment_id as segment_id,
    p1.g4 * 0.5 + p0.r3 * 0.5 as r1,
    p1.g3 + p0.r3 as r2,
    p1.g3 as r3,
    case when p1.g3 > p0.r3 then p1.g3 else p0.r3 end as r4
from {{ ref('rollup_0089') }} as p0
inner join {{ ref('seg_0177') }} as p1 on p1.segment_id = p0.segment_id
