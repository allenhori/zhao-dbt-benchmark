select
    p0.segment_id as segment_id,
    p1.g3 + p0.r2 as r1,
    p0.r2 as r2,
    p1.g4 + p2.g1 as r3
from {{ ref('rollup_0057') }} as p0
inner join {{ ref('seg_0372') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0282') }} as p2 on p2.segment_id = p0.segment_id
