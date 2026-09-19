select
    p0.segment_id as segment_id,
    p1.g1 as r1,
    p2.g3 as r2
from {{ ref('seg_0294') }} as p0
inner join {{ ref('seg_0319') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0176') }} as p2 on p2.segment_id = p0.segment_id
