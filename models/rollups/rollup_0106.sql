select
    p0.segment_id as segment_id,
    p2.g4 - p1.g3 as r1,
    case when p1.g4 > p0.g4 then p1.g4 else p0.g4 end as r2
from {{ ref('seg_0271') }} as p0
inner join {{ ref('seg_0005') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0055') }} as p2 on p2.segment_id = p0.segment_id
