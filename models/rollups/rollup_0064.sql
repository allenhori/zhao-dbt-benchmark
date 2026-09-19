select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p0.g3 as r2,
    case when p0.g2 > p1.r2 then p0.g2 else p1.r2 end as r3
from {{ ref('seg_0364') }} as p0
inner join {{ ref('rollup_0029') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0012') }} as p2 on p2.segment_id = p0.segment_id
