select
    p0.segment_id as segment_id,
    p2.g3 - p1.g1 as r1,
    p2.g3 + p1.g4 as r2
from {{ ref('seg_0139') }} as p0
inner join {{ ref('seg_0372') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0250') }} as p2 on p2.segment_id = p0.segment_id
