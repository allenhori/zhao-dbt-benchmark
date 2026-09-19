select
    p0.segment_id as segment_id,
    p0.g2 as r1,
    case when p1.g3 > p2.g1 then p1.g3 else p2.g1 end as r2
from {{ ref('seg_0126') }} as p0
inner join {{ ref('seg_0160') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0220') }} as p2 on p2.segment_id = p0.segment_id
