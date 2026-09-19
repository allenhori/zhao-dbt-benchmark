select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p0.g1 - p1.g1 as r2
from {{ ref('seg_0385') }} as p0
inner join {{ ref('seg_0388') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0296') }} as p2 on p2.segment_id = p0.segment_id
