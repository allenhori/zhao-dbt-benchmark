select
    p0.segment_id as segment_id,
    p0.r2 as r1,
    case when p0.r1 > p2.g1 then p0.r1 else p2.g1 end as r2,
    p2.g3 + p0.r1 as r3,
    p1.g4 - p0.r1 as r4
from {{ ref('rollup_0037') }} as p0
inner join {{ ref('seg_0258') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0102') }} as p2 on p2.segment_id = p0.segment_id
