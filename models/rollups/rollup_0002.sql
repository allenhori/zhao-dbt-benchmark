select
    p0.segment_id as segment_id,
    case when p1.g4 > p2.g3 then p1.g4 else p2.g3 end as r1,
    p1.g3 as r2,
    p0.g3 as r3
from {{ ref('seg_0339') }} as p0
inner join {{ ref('seg_0089') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0193') }} as p2 on p2.segment_id = p0.segment_id
