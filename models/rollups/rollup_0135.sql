select
    p0.segment_id as segment_id,
    p1.r4 * 0.5 + p0.g3 * 0.5 as r1,
    case when p1.r1 > p2.g4 then p1.r1 else p2.g4 end as r2
from {{ ref('seg_0267') }} as p0
inner join {{ ref('rollup_0018') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0394') }} as p2 on p2.segment_id = p0.segment_id
