select
    p0.segment_id as segment_id,
    p0.g2 * 0.5 + p1.g1 * 0.5 as r1,
    case when p1.g1 > p0.g1 then p1.g1 else p0.g1 end as r2,
    p1.g3 as r3
from {{ ref('seg_0230') }} as p0
inner join {{ ref('seg_0114') }} as p1 on p1.segment_id = p0.segment_id
