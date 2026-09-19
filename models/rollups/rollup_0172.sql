select
    p0.segment_id as segment_id,
    case when p1.r2 > p0.g2 then p1.r2 else p0.g2 end as r1,
    case when p1.r3 > p0.g1 then p1.r3 else p0.g1 end as r2,
    p1.r3 - p0.g2 as r3
from {{ ref('seg_0285') }} as p0
inner join {{ ref('rollup_0032') }} as p1 on p1.segment_id = p0.segment_id
