select
    p0.segment_id as segment_id,
    p1.r4 as r1,
    p0.g1 - p2.g2 as r2,
    case when p2.g3 > p0.g1 then p2.g3 else p0.g1 end as r3,
    p2.g1 + p1.r2 as r4
from {{ ref('seg_0099') }} as p0
inner join {{ ref('rollup_0024') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0196') }} as p2 on p2.segment_id = p0.segment_id
