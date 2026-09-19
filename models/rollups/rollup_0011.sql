select
    p0.segment_id as segment_id,
    p0.g2 - p1.g2 as r1,
    case when p2.g1 > p1.g3 then p2.g1 else p1.g3 end as r2
from {{ ref('seg_0205') }} as p0
inner join {{ ref('seg_0115') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0014') }} as p2 on p2.segment_id = p0.segment_id
