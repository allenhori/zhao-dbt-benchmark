select
    p0.segment_id as segment_id,
    case when p2.g1 > p0.g4 then p2.g1 else p0.g4 end as r1,
    p1.g1 as r2,
    p2.g1 as r3,
    p0.g1 - p2.g1 as r4
from {{ ref('seg_0161') }} as p0
inner join {{ ref('seg_0076') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0133') }} as p2 on p2.segment_id = p0.segment_id
