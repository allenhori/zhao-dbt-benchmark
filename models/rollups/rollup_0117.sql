select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    p1.g1 * 0.5 + p0.g4 * 0.5 as r2,
    p0.g4 as r3
from {{ ref('seg_0398') }} as p0
inner join {{ ref('seg_0359') }} as p1 on p1.segment_id = p0.segment_id
