select
    p0.segment_id as segment_id,
    case when p0.g1 > p1.g1 then p0.g1 else p1.g1 end as r1,
    p2.g2 as r2,
    p1.g3 + p0.g4 as r3
from {{ ref('seg_0031') }} as p0
inner join {{ ref('seg_0080') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0179') }} as p2 on p2.segment_id = p0.segment_id
