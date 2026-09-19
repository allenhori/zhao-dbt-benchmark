select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    p0.g2 as r2,
    case when p0.g1 > p1.g1 then p0.g1 else p1.g1 end as r3,
    p1.g2 + p0.g1 as r4
from {{ ref('seg_0222') }} as p0
inner join {{ ref('seg_0384') }} as p1 on p1.segment_id = p0.segment_id
