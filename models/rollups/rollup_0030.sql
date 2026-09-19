select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p1.g1 as r2,
    p1.g1 + p0.g2 as r3,
    case when p1.g1 > p0.g2 then p1.g1 else p0.g2 end as r4
from {{ ref('seg_0098') }} as p0
inner join {{ ref('seg_0223') }} as p1 on p1.segment_id = p0.segment_id
