select
    p0.segment_id as segment_id,
    p1.g4 as r1,
    p0.g1 - p1.g4 as r2
from {{ ref('seg_0228') }} as p0
inner join {{ ref('seg_0018') }} as p1 on p1.segment_id = p0.segment_id
