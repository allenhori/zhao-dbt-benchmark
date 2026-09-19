select
    p0.segment_id as segment_id,
    p2.g1 as r1,
    case when p0.r3 > p2.g3 then p0.r3 else p2.g3 end as r2
from {{ ref('rollup_0015') }} as p0
inner join {{ ref('seg_0080') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0257') }} as p2 on p2.segment_id = p0.segment_id
