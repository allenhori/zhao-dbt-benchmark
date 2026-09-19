select
    p0.segment_id as segment_id,
    p1.g2 as r1,
    case when p1.g3 > p0.g2 then p1.g3 else p0.g2 end as r2
from {{ ref('seg_0267') }} as p0
inner join {{ ref('seg_0352') }} as p1 on p1.segment_id = p0.segment_id
