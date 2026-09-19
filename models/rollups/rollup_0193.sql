select
    p0.segment_id as segment_id,
    p1.g3 as r1,
    p0.g1 as r2
from {{ ref('seg_0015') }} as p0
inner join {{ ref('seg_0328') }} as p1 on p1.segment_id = p0.segment_id
