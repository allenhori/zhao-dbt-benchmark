select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p0.g4 as r2,
    p0.g3 as r3
from {{ ref('seg_0056') }} as p0
inner join {{ ref('seg_0225') }} as p1 on p1.segment_id = p0.segment_id
