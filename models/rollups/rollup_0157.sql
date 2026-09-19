select
    p0.segment_id as segment_id,
    p2.g1 as r1,
    p1.g3 + p2.g4 as r2
from {{ ref('rollup_0106') }} as p0
inner join {{ ref('seg_0376') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0298') }} as p2 on p2.segment_id = p0.segment_id
