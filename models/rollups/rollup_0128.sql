select
    p0.segment_id as segment_id,
    p1.g1 as r1,
    p1.g3 as r2,
    p0.r1 - p2.g3 as r3,
    p0.r3 as r4
from {{ ref('rollup_0047') }} as p0
inner join {{ ref('seg_0091') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0236') }} as p2 on p2.segment_id = p0.segment_id
