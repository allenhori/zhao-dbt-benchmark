select
    p0.segment_id as segment_id,
    p1.g4 as r1,
    p1.g3 * 0.5 + p0.g1 * 0.5 as r2
from {{ ref('seg_0255') }} as p0
inner join {{ ref('seg_0391') }} as p1 on p1.segment_id = p0.segment_id
