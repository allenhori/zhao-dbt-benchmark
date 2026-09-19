select
    p0.segment_id as segment_id,
    p2.g3 - p1.g2 as r1,
    case when p2.g3 > p1.g2 then p2.g3 else p1.g2 end as r2,
    case when p2.g3 > p1.g3 then p2.g3 else p1.g3 end as r3
from {{ ref('rollup_0089') }} as p0
inner join {{ ref('seg_0073') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0278') }} as p2 on p2.segment_id = p0.segment_id
