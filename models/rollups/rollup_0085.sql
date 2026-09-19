select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    case when p0.g3 > p1.g3 then p0.g3 else p1.g3 end as r2,
    case when p0.g2 > p1.g2 then p0.g2 else p1.g2 end as r3,
    p1.g3 + p0.g3 as r4
from {{ ref('seg_0010') }} as p0
inner join {{ ref('seg_0022') }} as p1 on p1.segment_id = p0.segment_id
