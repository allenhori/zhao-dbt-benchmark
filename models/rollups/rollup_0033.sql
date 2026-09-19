select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p1.g2 - p0.g1 as r2,
    case when p0.g1 > p1.g3 then p0.g1 else p1.g3 end as r3
from {{ ref('seg_0379') }} as p0
inner join {{ ref('seg_0357') }} as p1 on p1.segment_id = p0.segment_id
