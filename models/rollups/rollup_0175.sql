select
    p0.segment_id as segment_id,
    case when p1.r3 > p2.g1 then p1.r3 else p2.g1 end as r1,
    p2.g2 - p1.r3 as r2
from {{ ref('seg_0313') }} as p0
inner join {{ ref('rollup_0117') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0246') }} as p2 on p2.segment_id = p0.segment_id
