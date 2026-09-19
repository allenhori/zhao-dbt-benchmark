select
    p0.segment_id as segment_id,
    case when p0.g1 > p2.g3 then p0.g1 else p2.g3 end as r1,
    p1.g3 + p0.g3 as r2
from {{ ref('seg_0121') }} as p0
inner join {{ ref('seg_0224') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0327') }} as p2 on p2.segment_id = p0.segment_id
