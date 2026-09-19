select
    p0.segment_id as segment_id,
    p0.g4 as r1,
    case when p1.g2 > p0.g1 then p1.g2 else p0.g1 end as r2
from {{ ref('seg_0328') }} as p0
inner join {{ ref('seg_0240') }} as p1 on p1.segment_id = p0.segment_id
