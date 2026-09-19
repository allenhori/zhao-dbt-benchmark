select
    p0.segment_id as segment_id,
    case when p1.g4 > p0.g2 then p1.g4 else p0.g2 end as r1,
    p1.g3 * 0.5 + p0.g1 * 0.5 as r2,
    p0.g3 as r3
from {{ ref('seg_0135') }} as p0
inner join {{ ref('seg_0065') }} as p1 on p1.segment_id = p0.segment_id
