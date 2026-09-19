select
    p0.segment_id as segment_id,
    p0.g2 as r1,
    p2.g1 as r2,
    case when p2.g4 > p1.g2 then p2.g4 else p1.g2 end as r3,
    p0.g3 + p2.g2 as r4
from {{ ref('seg_0096') }} as p0
inner join {{ ref('seg_0300') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0381') }} as p2 on p2.segment_id = p0.segment_id
