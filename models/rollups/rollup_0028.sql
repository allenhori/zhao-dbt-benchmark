select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    case when p0.g1 > p1.g3 then p0.g1 else p1.g3 end as r2,
    case when p1.g4 > p0.g2 then p1.g4 else p0.g2 end as r3
from {{ ref('seg_0354') }} as p0
inner join {{ ref('seg_0036') }} as p1 on p1.segment_id = p0.segment_id
